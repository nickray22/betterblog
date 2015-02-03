class UsersController < ApplicationController
  def index
    @users = User.all
    render :index
  end

  def show
    @users = User.find(params[:id])
    respond_to do |format|
      format.html {render :show}
      format.json {@users.to_json}
    end
  end

  def new
    @users = User.new
    render :new
  end

  def edit
    @users = User.find(params[:id])
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
end

private
def post_params
  params.require(:users).permit(:username, :password)
end
