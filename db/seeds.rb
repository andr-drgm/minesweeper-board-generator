# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Clear existing data (optional, for a clean slate)
Table.destroy_all

# Create 3 boards with empty board_data
Table.create!([
  { email: "user1@example.com", title: "Beginner Board", width: 8, height: 8, mines: 10, board_data: "" },
  { email: "user2@example.com", title: "Intermediate Board", width: 16, height: 16, mines: 40, board_data: "" },
  { email: "user3@example.com", title: "Expert Board", width: 30, height: 16, mines: 99, board_data: "" }
])

puts "Seeded 3 boards with empty board_data!"
