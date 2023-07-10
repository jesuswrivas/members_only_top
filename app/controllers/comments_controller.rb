class CommentsController < ApplicationController
  def new
  end

  def create
    @post = Post.find(params[:post_id])
    @new_comment = @post.comments.new(comment_params)

    if @new_comment.save
      flash[:notice] = "Comment saved, thank you!"
    else
      flash[:alert] = "Something went wrong"
    end

    redirect_to :root
  end
  


  private

  def comment_params
    params.require(:comment).permit(:guest_name, :body)
  end
  
end
