class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :service_listing
  has_one :professional, through: :service_listing

  enum status: {
    requested: "requested",
    accepted: "accepted",
    on_the_way: "on_the_way",
    arrived: "arrived",
    in_progress: "in_progress",
    completed: "completed",
    paid: "paid",
    reviewed: "reviewed",
    cancelled: "cancelled"
  }
end
