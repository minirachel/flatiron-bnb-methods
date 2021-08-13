class City < ActiveRecord::Base
  has_many :neighborhoods
  has_many :listings, :through => :neighborhoods

  def city_openings(date1, date2)
    # listings available for every date between 1 and 2 including 1 and 2
    date01 = date1.to_date
    date02 = date2.to_date

    date_range = []

    date01.upto(date02) do |date|
       date_range << date
    end


    available_listings = self.listings.select do |l|
      date_range.each do |date|
        l.reservations.select do |r| 
          binding.pry
          r.status == "available" && r.checkin != date && r.checkout != date
        end
      end
    end

    available_listings

  end
end
#need to compare search_date_range with reservation_date_range
# rspec ./spec/models/city_spec.rb:13