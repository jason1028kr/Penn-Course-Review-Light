class Student < ApplicationRecord
  validates_presence_of :first_name, :last_name
  has_many :courses_students, dependent: :destroy
  has_many :courses, through: :courses_students

  def full_name
    "#{first_name} #{last_name}"
  end
end
