class VotesController < ApplicationController
  before_action :set_post

  def index
    #@comments = Comment.all
    #@posts = comment.find(params[:post_id])
    @votes = @post.votes.all # this gets the current post then the comments for it
  end

  def new
    @vote = Vote.new
  end

  def create
  

    @vote = @post.votes.new(vote_params.merge(user: current_user))
    #above is the same as bellow
    # @comment = Comment.new(comment_params)
    # @comment.user = current_user

    respond_to do |format|
      if @vote.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @vote }
      else
        format.html {redirect_to @post, notice: 'an error occured'}#{ render :new } #here redirect to where ever
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @vote.update(post_params)
        format.html { redirect_to @vote, notice: 'Thanks for the vote' }
        format.json { render :show, status: :ok, location: @vote }
      else
        format.html { render :edit }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end



  def set_post
    @post = Post.find(params[:post_id]) # sets the post variable
  end

  def vote_params
    #dont need :user_id or :post_id as there not coming from the form
    params.require(:vote).permit(:answer, :selected)
  end



  end
