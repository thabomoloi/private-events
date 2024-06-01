class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :event_attendances, dependent: :destroy
  has_many :attendees, through: :event_attendances, source: :user

  validates :name, presence: true, length: { maximum: 100 }
  validates :location, presence: true, length: { maximum: 100 }
  validates :description, length: { minimum: 10, maximum: 500 }
  validates :date, presence: true
end
