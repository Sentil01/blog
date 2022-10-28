class PostsController < ApplicationController
  before_action :authenticate_user!

  before_action :get_post
  before_action :set_post, only: %i[ show edit update destroy ]
  # before_action :get_user
  # GET /posts or /posts.json
  def index
    if params[:topic_id].present?
      @posts = @topic.posts.paginate(page: params[:page],per_page: 2)
    else
      @posts=Post.all.paginate(page: params[:page],per_page: 2)

    end

  end

  # GET /posts/1 or /posts/1.json
  def show
    if params[:topic_id].present?
      @post=@topic.posts.find(params[:id])
    else
      @post=Post.find(params[:id])
    end
  end

  # GET /posts/new
  def new
    if params[:topic_id].present?
      @post = @topic.posts.build
    else
      @post=Post.new
    end

  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    if params[:topic_id].present?
      @post = @topic.posts.build(post_params.except(:tags))
      create_or_delete_posts_tags(@post,params[:post][:tags])
      respond_to do |format|
        if @post.save
          format.html { redirect_to topic_posts_path(@topic), notice: "Post was successfully created." }
          format.json { render :show, status: :created, location: @post }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    else
      @post=Post.new(post_params.except(:tags))
      create_or_delete_posts_tags(@post,params[:post][:tags])
      respond_to do |format|
        if @post.save
          format.html { redirect_to posts_path, notice: "Post was successfully created." }
          format.json { render :show, status: :created, location: @post }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end

    end



  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    if params[:topic_id].present?
      respond_to do |format|
        if @post.update(post_params.except(:tags))
          create_or_delete_posts_tags(@post,params[:post][:tags])
          format.html { redirect_to topic_posts_path(@topic), notice: "Post was successfully updated." }
          format.json { render :show, status: :ok, location: @post }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
        end
      else
        respond_to do |format|
          if @post.update(post_params.except(:tags))
            create_or_delete_posts_tags(@post,params[:post][:tags])
            format.html { redirect_to post_path(@post), notice: "Post was successfully updated." }
            format.json { render :show, status: :ok, location: @post }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @post.errors, status: :unprocessable_entity }
            end
        end


    end


  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    if params[:topic_id].present?
      respond_to do |format|
        format.html { redirect_to topic_posts_path(@topic), notice: "Post was successfully destroyed." }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to posts_path(@post), notice: "Post was successfully destroyed." }
        format.json { head :no_content }
      end

    end

  end

  private

  def create_or_delete_posts_tags(post,tags)
    post.taggables.destroy_all
    tags=tags.strip.split(',')
    tags.each do |tag|
      post.tags << Tag.find_or_create_by(name: tag)
    end
  end
  def get_post
    if params[:topic_id].present?
      @topic=Topic.find(params[:topic_id])

    end

  end

    # Use callbacks to share common setup or constraints between actions.
    def set_post
      if params[:topic_id].present?
        @post = @topic.posts.find(params[:id])

      else
        @post=Post.find(params[:id])

      end

    end
  # def get_user
  #   @user=User.find(params[:@post.user_id])
  # end
    # Only allow a list of trusted parameters through.
    def post_params
      if params[:topic_id].present?
        params.require(:post).permit(:title, :body, :topic_id, :tags, :cover_picture, :user_id)
      else
        params.require(:post).permit(:title, :body, :tags, :cover_picture, :user_id)

      end

    end
end
