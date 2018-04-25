class CoursesStudent < ApplicationRecord
  validates :student, uniqueness: { scope: :course }
  belongs_to :course
  belongs_to :student
end
