class CommentsController < ApplicationController
  before_action :set_post
#this is the latest comments
  def index
    @comments = Comment.all
    #@posts = comment.find(params[:post_id])
    #@comments = @post.comments.all # this gets the current post then the comments for it
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = @post.comments.new(comment_params.merge(user: current_user))
    #above is the same as bellow
    # @comment = Comment.new(comment_params)
    # @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: 'Comment created successfully.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end



  def set_post
    @post = Post.find(params[:post_id]) # sets the post variable
  end

  def comment_params
    #dont need :user_id or :post_id as there not coming from the form
    params.require(:comment).permit(:content)
  end



end
