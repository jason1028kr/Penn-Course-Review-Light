class ProfessorReview < ApplicationRecord
  validates_presence_of :content
  belongs_to :professor
end
