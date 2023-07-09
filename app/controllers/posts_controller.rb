class PostsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def new
    @user = current_user
    @new_post = current_user.posts.new
          
  end

  
  def create
    @user = current_user
    @new_post = current_user.posts.new(post_params)
 
    if @new_post.save
      redirect_to :root, notice: "Post created succesfully"
      
    else
      flash.now[:alert] = "Something went wrong"
      render :new,  status: :unprocessable_entity 
    end

  end


  def show
    @post = Post.find(params[:id])

    # We increment the counter
    @post.increment_view
  end
   

  def index

  end


  private

  def post_params
    params.require(:post).permit(:title, :body)
  end



end
