class Admin::UsersController < ApplicationController
  before_action :own_user, only: [:edit, :update]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where(:user => @user)
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

  private
    def own_user
      @user = User.find(params[:id])

      if current_user != @user
        redirect_to [:admin, @user], notice: "Vous ne pouvez pas editer cet utilisateur !"
      end
    end

end
