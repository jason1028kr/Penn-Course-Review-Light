class ProfessorReviewsController < ApplicationController
  before_action :set_professor
  before_action :set_professor_review, except: [:create]


  # POST /professor_reviews
  # POST /professor_reviews.json
  def create
    @professor_review = @professor.professor_reviews.create(professor_review_params)
    redirect_to "/professors/#{@professor.id}"
  end

  # GET /professor_reviews/1/edit
  def edit
  end

  # PATCH/PUT /professor_reviews/1
  # PATCH/PUT /professor_reviews/1.json
  def update
    if @professor_review.update(professor_review_params)
      redirect_to "/professors/#{@professor.id}"
    else
      render :edit
    end
  end

  # DELETE /professor_reviews/1
  # DELETE /professor_reviews/1.json
  def destroy
    @professor_review.destroy
    redirect_to "/professors/#{@professor.id}"
  end

  private

    def set_professor
      @professor = Professor.find(params[:professor_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_professor_review
      @professor_review = ProfessorReview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def professor_review_params
      params.require(:professor_review).permit(:content)
    end
end
