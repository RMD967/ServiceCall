class Professional < ApplicationRecord
  belongs_to :user
  has_many :service_listings, dependent: :destroy
  has_many :appointments, through: :service_listings
  has_many :service_categories, through: :service_listings
  has_many :ratings, dependent: :destroy

  def average_rating
    ratings.average(:rating)&.round(1)
  end
end
