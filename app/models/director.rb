class Director < ApplicationRecord
  validates :name, presence: true
  validates :dob, presence: true
  validates :bio, presence: true
end
