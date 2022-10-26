class RatingsController < ApplicationController
  before_action :get_post
  before_action :get_rating
  before_action :set_rating, only: %i[ show edit update destroy ]

  # GET /ratings or /ratings.json
  def index
    @ratings = @post.ratings.all
  end

  # GET /ratings/1 or /ratings/1.json
  def show
  end

  # GET /ratings/new
  def new
    @rating = @post.ratings.new
  end

  # GET /ratings/1/edit
  def edit
  end

  # POST /ratings or /ratings.json
  def create
    @rating = @post.ratings.build(rating_params)

    respond_to do |format|
      if @rating.save
        format.html { redirect_to params[:topic_id].present? ? topic_posts_path(@topic) : posts_path, notice: "Rating was successfully created." }
        format.json { render :show, status: :created, location: @rating }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ratings/1 or /ratings/1.json
  def update
    respond_to do |format|
      if @rating.update(rating_params)
        format.html { redirect_to rating_url(@rating), notice: "Rating was successfully updated." }
        format.json { render :show, status: :ok, location: @rating }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ratings/1 or /ratings/1.json
  def destroy
    @rating.destroy

    respond_to do |format|
      format.html { redirect_to params[:topic_id].present? ? topic_posts_path(@topic) : posts_path, notice: "Rating was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def get_post
    if params[:topic_id].present?
      @topic = Topic.find(params[:topic_id])

    end

  end
  def get_rating
    if params[:topic_id].present?
      @post=@topic.posts.find(params[:post_id])
    end
    @post = Post.find(params[:post_id])
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_rating
      @rating = @post.ratings.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rating_params
      params.require(:rating).permit(:star, :post_id)
    end
end
