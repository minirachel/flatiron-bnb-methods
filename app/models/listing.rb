class Listing < ActiveRecord::Base
  belongs_to :neighborhood
  belongs_to :host, :class_name => "User"
  has_many :reservations
  has_many :reviews, :through => :reservations
  has_many :guests, :class_name => "User", :through => :reservations

  validates :address, presence: true
  validates :listing_type, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :neighborhood, presence: true

  after_save :change_user_to_host
  before_destroy :remove_host


  private

  def change_user_to_host
    host.update(host: true)
  end

  def remove_host
    if Listing.where(host: host).where.not(id: id).empty?
      host.update(host: false)
    end
  end

  # def self.available(start_date, end_date)
  #   if start_date && end_date
  #     joins(:reservations).
  #       where.not(reservations: {check_in: start_date..end_date}) &
  #     joins(:reservations).
  #       where.not(reservations: {check_out: start_date..end_date})
  #   else
  #     []
  #   end
  # end
end
