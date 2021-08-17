class City < ActiveRecord::Base
  has_many :neighborhoods
  has_many :listings, :through => :neighborhoods

#   def city_openings(start_date, end_date)

#     # self.listings.merge(Listing.available(start_date, end_date))

#     # listings available for every date between 1 and 2 including 1 and 2
#     # search_date_start = date1.to_date
#     # search_date_end = date2.to_date

#     # available_listings = []
#     # unavailable_listings = []

#     # self.listings.each do |l|
#     #   l.reservations.each do |r| 
#     #     res_date_start = r.checkin
#     #     res_date_end = r.checkout
#     #     (search_date_start <= res_date_end) && (search_date_end >= res_date_start)
#     #   end
#     # end

#     # available_listings
# end

end


