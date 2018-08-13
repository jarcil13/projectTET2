class Marker < ApplicationRecord
  belongs_to :user

  validates :lati, presence: true
  validates :long, presence: true
end
