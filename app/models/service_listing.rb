class ServiceListing < ApplicationRecord
  PRICE_UNITS = %w[fixed per_hour quote].freeze

  belongs_to :professional
  belongs_to :service_category
  has_many :appointments, dependent: :destroy

  validates :title, presence: true
  validates :price_unit, inclusion: { in: PRICE_UNITS }

  scope :active, -> { where(active: true) }
end
