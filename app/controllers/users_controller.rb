class UsersController < ApplicationController
  def index
    @user = User.all
    render :index
  end

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html {render :show}
      format.json {@users.to_json}
    end
  end

  def new
    @user = User.new
    render :new
  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: "User deleted"
  end
end

private
def user_params
  params.require(:user).permit(:username)
end
