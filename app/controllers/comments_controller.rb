class CommentsController < ApplicationController
 before_action :set_post, only: [:show, :edit, :update, :destroy]

#before_action :set_post, only: [:show, :edit, :update, :destroy]




  def index
    @comments = Comment.all
  end

  def show
    @comments = @post.comments.all
    @comment = @post.comments.new
  end

  def new
    @comment = Comment.new
  end

  def create
    #@comment = Comment.new
    @comment = Comment.new
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

end

private
def set_post
     @post = Post.find(params[:post_id])
   end    # Use callbacks to share common setup or constraints between actions.

   def comment_params
     params.require(:post).permit(:content, :post_id, :user_id)
   end
