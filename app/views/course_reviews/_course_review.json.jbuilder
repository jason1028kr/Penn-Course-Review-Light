json.extract! course_review, :id, :content, :course_id, :created_at, :updated_at
json.url course_review_url(course_review, format: :json)
