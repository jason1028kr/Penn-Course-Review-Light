class Course < ApplicationRecord
  validates_presence_of :number, :title, :description
  validates_uniqueness_of :number
  has_many :course_reviews, dependent: :destroy

  has_many :courses_students, dependent: :destroy
  has_many :courses_professors, dependent: :destroy

  has_many :students, through: :courses_students
  has_many :professors, through: :courses_professors


  def full_title
    "#{number} - #{title}"
  end
end
