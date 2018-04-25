class CourseReview < ApplicationRecord
  validates_presence_of :content
  belongs_to :course
end
