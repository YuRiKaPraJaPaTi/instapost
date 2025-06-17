class CommentsController < ApplicationController
      def create
            @post = Post.find(params[:post_id])
            @comment = @post.comments.create(comment_params.merge(user_id: current_user.id))
            if @comment.valid?
                  # redirect_to root_path
                  respond_to do |format|
                        format.turbo_stream { render turbo_stream: turbo_stream.append("comments_#{@post.id}", partial: "posts/comments/postComment", locals: { comment: @comment, post:@post}) }
                        format.html { redirect_to @post }
                  end
            else
                  # flash[:alert] = "Invalid params"
                  # redirect_to root_path
                  # Handle the case where comment is not saved
                  redirect_to @post, alert: "Error posting comment."
            end
      end


      def destroy
            @post = Post.find(params[:post_id])
            @comment = @post.comments.find(params[:id])
            @comment.destroy
            redirect_to root_path
      end

      private

      def comment_params
            params.require(:comment).permit(:text, :post_id)
      end

end
