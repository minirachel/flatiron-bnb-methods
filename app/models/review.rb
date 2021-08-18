class Review < ActiveRecord::Base
  belongs_to :reservation
  belongs_to :guest, :class_name => "User"

  validates :rating, presence: true
  validates :description, presence: true
  validate :real_reservation

  def real_reservation
    self.reservation != nil && self.reservation.status == "accepted" && Date.today >= self.reservation.checkout.to_date
  end
end
