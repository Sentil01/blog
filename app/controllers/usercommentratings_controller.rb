class UsercommentratingsController < ApplicationController
  before_action :set_usercommentrating, only: %i[ show edit update destroy ]
  before_action :get_comment
  # GET /usercommentratings or /usercommentratings.json
  def index
    @usercommentratings = @comment.usercommentratings.all
  end

  # GET /usercommentratings/1 or /usercommentratings/1.json
  def show
  end

  # GET /usercommentratings/new
  def new
    @usercommentrating = @comment.usercommentratings.build
  end

  # GET /usercommentratings/1/edit
  def edit
  end

  # POST /usercommentratings or /usercommentratings.json
  def create
    @usercommentrating = @comment.usercommentratings.build(usercommentrating_params)

    respond_to do |format|
      if @usercommentrating.save
        format.html { redirect_to post_comments_path(@comment.post_id,@comment), notice: "Usercommentrating was successfully created." }
        format.json { render :show, status: :created, location: @usercommentrating }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @usercommentrating.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usercommentratings/1 or /usercommentratings/1.json
  def update
    respond_to do |format|
      if @comment.usercommentratings.update(usercommentrating_params)
        format.html { redirect_to comment_usercommentrating_path(@comment,@usercommentrating), notice: "Usercommentrating was successfully updated." }
        format.json { render :show, status: :ok, location: @usercommentrating }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @usercommentrating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usercommentratings/1 or /usercommentratings/1.json
  def destroy
    @comment.usercommentratings.destroy

    respond_to do |format|
      format.html { redirect_to comment_usercommentrating_path(@comment,@usercommentrating), notice: "Usercommentrating was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions

  def get_comment
    @comment=Comment.find(params[:comment_id])

  end



    def set_usercommentrating
      @usercommentrating = @comment.usercommentratings.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def usercommentrating_params
      params.require(:usercommentrating).permit(:rating, :user_id, :comment_id)
    end
end
