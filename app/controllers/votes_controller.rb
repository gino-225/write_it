class VotesController < ApplicationController
  before_action :set_post
  before_action :set_vote, only: [:update]

  def index
    #@comments = Comment.all
    #@posts = comment.find(params[:post_id])
    @votes = @post.votes.all # this gets the current post then the comments for it
  end

  def new
    @vote = Vote.new
  end

  # p = Post.find(2)
  # v = p.votes.all
  # v.each do |vote|
  #   vote.destroy
  # end

  def create

    @vote = @post.votes.new(vote_params.merge(user: current_user))
    #above is the same as bellow
    # @comment = Comment.new(comment_params)
    # @comment.user = current_user

    respond_to do |format|


      

      if @vote.save
        format.html { redirect_back fallback_location: root_path, notice: 'Every Votes Counts.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html {redirect_to @post, notice: 'an error occured'}#{ render :new } #here redirect to where ever
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end

    end
  end


  def update
    respond_to do |format|
      if @vote.update(vote_params)
        format.html { redirect_back fallback_location: root_path, notice: 'Thanks for the vote' }
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

  def set_vote
    @vote = Vote.find(params[:id])
  end


  def vote_params
    #dont need :user_id or :post_id as there not coming from the form
    params.require(:vote).permit(:answer, :selected)
  end


end
