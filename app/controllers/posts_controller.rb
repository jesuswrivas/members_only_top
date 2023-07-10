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

        @new_comment = @post.comments.new
    

    
  end
   
  def index
    @last_10_posts = current_user.posts.order(created_at: :desc).limit(10)

  end

  def edit
    @user = current_user
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
   
    if @post.update(post_params)
      flash[:notice] = "The post was updated succesfully"
    else
      flash[:alert] = "Something went wrong. We couldnt update the post"
    end
    redirect_to user_posts_path(current_user.id)
  end


  def destroy
    @post = Post.find(params[:id])
   
    ActiveRecord::Base.transaction do
      @post.comments.destroy_all
      @post.destroy
      redirect_to user_posts_path(current_user.id)
    end
    
  end


  private

  def post_params
    params.require(:post).permit(:title, :body)
  end



end
