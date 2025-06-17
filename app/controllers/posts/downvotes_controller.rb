class Posts::DownvotesController < ApplicationController
      def create
            @post = Post.find(params[:post_id])
            @post.disliked_by current_user
            respond_to do |format|
                  format.turbo_stream { render turbo_stream: turbo_stream.replace("post_#{params[:post_id]}_container", partial: 'posts/upvotes/likes', locals: { post: @post }) }
            
                  # redirect_to post_path(@post)
                  format.html do
                  redirect_to posts_path, notice: 'Post unliked.'
                  end
            end
      end
end
