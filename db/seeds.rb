require_relative '../app/models/restaurant'

puts "###########################################################################"
puts "# Purging #{Restaurant.count} records…"
puts "###########################################################################"
print "\n"
Restaurant.destroy_all

puts "###########################################################################"
puts "# Creating Restaurants…"
puts "###########################################################################"
print "\n"
25.times do
  restaurant = Restaurant.create!(
    name: "#{Faker::GreekPhilosophers.name}'s #{Faker::Demographic.demonym} #{Faker::Restaurant.name}",
    address: "#{Faker::Address.community}, #{Faker::Address.street_address} #{Faker::Address.city}",
    category: Restaurant::CATEGORY_LIST.sample
    )    
    rand(2..17).times do
      review = Review.create!(
        content: "Had the #{Faker::Food.dish}. The #{Faker::Food.ingredient} tasted like #{Faker::Food.fruits}. Also I found #{Faker::Food.spice} in the #{Faker::Food.vegetables}. I ate everything, but next time I'm going to ask to speak with the manager!",
        rating: rand(0..5),
        restaurant: restaurant
        )
      end
      puts "Created: #{restaurant.name} | with #{restaurant.reviews.count} reviews…"
    end
print "\n"
puts "###########################################################################"
puts "# Successfully generated #{Restaurant.count} restaurants into the database."
puts "###########################################################################"
print "\n"
