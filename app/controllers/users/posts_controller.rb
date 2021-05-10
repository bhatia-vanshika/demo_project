class Users::PostsController < ApplicationController

  def index
    @posts = current_user.posts
  end

  def new
    @post = current_user.posts.build
  end

    before_action :set_post, only: %i[ show edit update destroy ]

  def create
    logger.warn("========#{current_user.inspect}")
    @post = current_user.posts.build(post_params)
    logger.warn("00000000000#{@post.inspect}")
    
    respond_to do |format|
      if @post.save
        format.html { redirect_to users_post_path(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        logger.warn("+++++++++++++#{@post.errors.inspect}")
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to users_post_path(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to users_posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :body)
    end
end 