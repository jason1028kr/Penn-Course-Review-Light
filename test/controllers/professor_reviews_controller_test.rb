require 'test_helper'

class ProfessorReviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @professor_review = professor_reviews(:one)
  end

  test "should get index" do
    get professor_reviews_url
    assert_response :success
  end

  test "should get new" do
    get new_professor_review_url
    assert_response :success
  end

  test "should create professor_review" do
    assert_difference('ProfessorReview.count') do
      post professor_reviews_url, params: { professor_review: { content: @professor_review.content, professor_id: @professor_review.professor_id } }
    end

    assert_redirected_to professor_review_url(ProfessorReview.last)
  end

  test "should show professor_review" do
    get professor_review_url(@professor_review)
    assert_response :success
  end

  test "should get edit" do
    get edit_professor_review_url(@professor_review)
    assert_response :success
  end

  test "should update professor_review" do
    patch professor_review_url(@professor_review), params: { professor_review: { content: @professor_review.content, professor_id: @professor_review.professor_id } }
    assert_redirected_to professor_review_url(@professor_review)
  end

  test "should destroy professor_review" do
    assert_difference('ProfessorReview.count', -1) do
      delete professor_review_url(@professor_review)
    end

    assert_redirected_to professor_reviews_url
  end
end
