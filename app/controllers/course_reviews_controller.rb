class CourseReviewsController < ApplicationController
  before_action :set_course
  before_action :set_course_review, except: [:create]


  # POST /course_reviews
  # POST /course_reviews.json
  def create
    @course_review = @course.course_reviews.create(course_review_params)
    redirect_to "/courses/#{@course.id}"
  end
  # GET /course_reviews/1/edit
  def edit
  end

  # PATCH/PUT /course_reviews/1
  # PATCH/PUT /course_reviews/1.json
  def update
    if @course_review.update(course_review_params)
      redirect_to "/courses/#{@course.id}"
    else
      render :edit
    end
  end

  # DELETE /course_reviews/1
  # DELETE /course_reviews/1.json
  def destroy
    @course_review.destroy
    redirect_to "/courses/#{@course.id}"
  end

  private

    def set_course
      @course = Course.find(params[:course_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_course_review
      @course_review = CourseReview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_review_params
      params.require(:course_review).permit(:content)
    end
end
