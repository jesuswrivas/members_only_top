class PagesController < ApplicationController

  
  def main
    @latest_5_posts = Post.order(created_at: :desc).limit(5)
   
  end

end
