json.extract! course, :id, :number, :title, :description, :created_at, :updated_at
json.url course_url(course, format: :json)
