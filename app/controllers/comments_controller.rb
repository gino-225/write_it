class CommentsController < ApplicationController
  before_action :set_post

  def index
    #@comments = Comment.all
    #@posts = comment.find(params[:post_id])
    @comments = @post.comments.all # this gets the current post then the comments for it
  end

  def new
    @comment = Comment.new
  end

  def create
    #@comment.post_id = @post.find(params[:post_id])
    #@comment.post_id = @post.id
    #@comment.post_id = @post.id

    @comment = Comment.new(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
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
    params.require(:comment).permit(:content, :user_id, :post_id)
  end



end
