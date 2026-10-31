class ServiceCategory < ApplicationRecord
  has_many :service_listings, dependent: :destroy
  has_many :professionals, through: :service_listings

  validates :name, presence: true
end
