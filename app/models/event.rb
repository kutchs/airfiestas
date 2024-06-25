class Event < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_one_attached :image
  validates :name, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :date_time, presence: true
end
