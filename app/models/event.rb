class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"

  validates :name, presence: true, length: { maximum: 100 }
  validates :location, presence: true, length: { maximum: 100 }
  validates :description, length: { minimum: 10, maximum: 500 }
  validates :date, presence: true
  validate :date_cannot_be_in_the_past

  private

  def date_cannot_be_in_the_past
    if date.present? && date < Time.now
      errors.add(:date, "can't be in the past")
    end
  end
end
