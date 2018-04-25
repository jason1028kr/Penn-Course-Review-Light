class Professor < ApplicationRecord
  validates_presence_of :first_name, :last_name
  has_many :courses_professors, dependent: :destroy
  has_many :courses, through: :courses_professors

  has_many :professor_reviews, dependent: :destroy

  def full_name
    "#{first_name} #{last_name}"
  end
end
