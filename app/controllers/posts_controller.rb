class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :own_post, only: [:edit, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 5).order(created_at: :desc)
  end

  # GET /posts/1
  def show
  end

  # GET /posts/new
  def new
    @post = current_user.posts.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to @post, notice: 'Post crée avec succès.'
    else
      render :new
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post édité avec succès.'
    else
      render :edit
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
      redirect_to posts_url, notice: 'Post supprimé avec succès'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :picture)
    end

    def own_post
      @post = Post.find(params[:id])

      if current_user != @post.user
        redirect_to @post, notice: "Vous ne pouvez pas editer ou supprimer ce post !"
      end
    end
end
