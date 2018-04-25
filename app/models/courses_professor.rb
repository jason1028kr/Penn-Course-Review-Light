class CoursesProfessor < ApplicationRecord
  validates :professor, uniqueness: { scope: :course }
  belongs_to :course
  belongs_to :professor
end
