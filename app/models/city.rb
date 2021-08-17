class City < ActiveRecord::Base
  has_many :neighborhoods
  has_many :listings, :through => :neighborhoods

  def city_openings(date1, date2)
    # listings available for every date between 1 and 2 including 1 and 2
    search_date_start = date1.to_date
    search_date_end = date2.to_date

    # date_range = []

    # search_date_start.upto(search_date_end) do |date|
    #    date_range << date
    # end


    self.listings.select do |l|
      l.reservations. do |r| 
        res_date_start = r.checkin
        res_date_end = r.checkout
        r.status == "available" && (search_date_start <= res_date_end) && (search_date_end >= res_date_start)
      end
    end

  end
end
#need to compare search_date_range with reservation_date_range
# rspec ./spec/models/city_spec.rb:13