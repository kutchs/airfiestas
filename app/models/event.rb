class Event < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_one_attached :image

  def formatted_date
    date_time.strftime("%d / %m / %Y")
  end
end
