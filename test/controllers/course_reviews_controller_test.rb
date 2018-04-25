require 'test_helper'

class CourseReviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course_review = course_reviews(:one)
  end

  test "should get index" do
    get course_reviews_url
    assert_response :success
  end

  test "should get new" do
    get new_course_review_url
    assert_response :success
  end

  test "should create course_review" do
    assert_difference('CourseReview.count') do
      post course_reviews_url, params: { course_review: { content: @course_review.content, course_id: @course_review.course_id } }
    end

    assert_redirected_to course_review_url(CourseReview.last)
  end

  test "should show course_review" do
    get course_review_url(@course_review)
    assert_response :success
  end

  test "should get edit" do
    get edit_course_review_url(@course_review)
    assert_response :success
  end

  test "should update course_review" do
    patch course_review_url(@course_review), params: { course_review: { content: @course_review.content, course_id: @course_review.course_id } }
    assert_redirected_to course_review_url(@course_review)
  end

  test "should destroy course_review" do
    assert_difference('CourseReview.count', -1) do
      delete course_review_url(@course_review)
    end

    assert_redirected_to course_reviews_url
  end
end
