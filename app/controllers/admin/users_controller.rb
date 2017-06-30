class Admin::UsersController < ApplicationController


  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new
    @user.update_attributes params[:user].permit(:firstname, :lastname, :age, :avatar)

    if @user.save
      redirect_to @user
    else
      render "new"
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes params[:user].permit(:firstname, :lastname, :age, :avatar)

    if @user.save
      redirect_to [:admin,@user]
    else
      render "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to [:admin,:users]
  end

end
