class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:edit]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  #@deadline = Deadline.find(params[:id])

  # GET /posts
  # GET /posts.json
  def index

    # @posts = Post.all.sort_by {|post| post.votes.count}.reverse
    @posts = Post.all.sort_by {|post| post.counting_votes}.reverse

    @post = @posts
    # @votes = @post.votes.all
    # @vote = Vote.new
    #@vote = @post.find(params[:id])
  end

  # GET /posts/1
  # GET /posts/1.json
  def show

   @comments = @post.comments.all # => Will give you all comments for this post
   @comment = Comment.new # => Will give you a new comment for the form

   #@votes = @post.comments.all # => Will give you all comments for this post
   @votes = @post.votes.all
   @vote = Vote.new

  end

  # GET /posts/new
  def new

      @post = Post.new

    # @post = Post.new

  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :user_id)
    end

    # def coupon_params
    #   params.require(:coupon).permit(:store, :coupon_code)
    # end
end
