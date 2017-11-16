namespace :populate do

  desc "Populate database with fuel prices"

  task gas_stations_prices: :environment do
    gas_stations_updated_count = 0

    GasStation.all.each do |gas_station|
      next if !gas_station.gas_price.nil? && !gas_station.alcohol_price.nil? && !gas_station.diesel_price.nil?
      user = User.find_by_email("j@j.com")
      if gas_station.gas_price.nil?
        gas_station.price_suggestions.create(fuel_type: 'gas', value: 4.00, user: user)
      end
      if gas_station.alcohol_price.nil?
        gas_station.price_suggestions.create(fuel_type: 'alcohol', value: 3.00, user: user)
      end
      if gas_station.diesel_price.nil?
        gas_station.price_suggestions.create(fuel_type: 'diesel', value: 5.00, user: user)
      end
      if gas_station.reputation.nil?
        gas_station.ratings.create(stars: rand(5), user: user)
      end
      gas_stations_updated_count += 1
    end

    puts "#{gas_stations_updated_count} Gas stations updated"
  end
end
