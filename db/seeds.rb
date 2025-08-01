# Clear existing data in the right order to avoid foreign key violations
require "open-uri"

# Destroy bookings first because they belong to families
Booking.destroy_all

# Destroy families next because they belong to providers
Family.destroy_all

# Then destroy providers because they belong to users
Provider.destroy_all

# Finally, destroy provider users
User.where(role: 'provider').destroy_all

# Now proceed with seeding fresh data
members_options = [
  "The Watanabe Family", "The Sato Clan", "The Nakamura Group", "The Yamamoto Crew",
  "The Kimura Household", "The Fujimoto Siblings", "The Ishikawa Family", "The Takahashi Trio",
  "The Tanaka League", "The Hayashi Circle"
]

locations = ["Tokyo", "Osaka", "Kyoto", "Nagoya", "Fukuoka", "Sapporo", "Hiroshima", "Sendai", "Kobe", "Yokohama"]

event_type_options = ["Birthday parties", "Weddings, Graduations", "Cosplay events", "Bbq parties", "Tea parties", "Kids' parties", "Masquerade parties", "Dinner parties", "Karaoke, dance parties", "Anniversaries"]

hourly_rate_options = [3000, 5000, 4500, 3200, 2800, 4000, 2500, 3600, 3900, 4100]

descriptions = [
  "A warm family of five who love hosting children's birthday parties and storytelling nights.",
  "An elegant couple and their twin daughters, perfect for formal events and cultural ceremonies.",
  "Three siblings with a passion for games and cosplay, ideal for festive celebrations.",
  "A joyful four-member crew who specialize in BBQs and laughter-filled gatherings.",
  "Two retired grandparents and their dog, offering heartwarming companionship for tea events.",
  "Young, lively siblings who bring energy to any party, especially great with kids.",
  "A creative household that excels at themed events and surprise performances.",
  "A charming trio who are pros at formal dinners and sophisticated get-togethers.",
  "A fun-loving family known for karaoke nights and dance-friendly environments.",
  "A flexible, well-organized circle ready for business picnics or heartfelt anniversaries."
]

photo_urls = [
  "https://res.cloudinary.com/dgazqe2qa/image/upload/v1753878254/premium_photo-1726797766978-11a0b18dc341_sq5n6r.jpg",
  "https://res.cloudinary.com/dgazqe2qa/image/upload/v1753878674/photo-1752118632837-8cc84a63c5c9_dytzxw.jpg",
  "https://res.cloudinary.com/dgazqe2qa/image/upload/v1753878433/photo-1637034373762-331b87526bb5_zxjk60.jpg",
  "https://res.cloudinary.com/dgazqe2qa/image/upload/v1753879413/premium_photo-1723651236162-8f68426582ab_i9vye3.jpg",
  "https://res.cloudinary.com/dgazqe2qa/image/upload/v1753879533/premium_photo-1682091354828-d5db1f94817e_beqxg4.jpg",
  "https://res.cloudinary.com/dgazqe2qa/image/upload/v1753879933/premium_photo-1664304880671-368b1f467f5d_h7em1r.jpg",
  "https://res.cloudinary.com/dgazqe2qa/image/upload/v1753881670/premium_photo-1723651234678-6bb89227cf6f_p8ojjj.jpg",
  "https://res.cloudinary.com/dgazqe2qa/image/upload/v1753962881/elegant-family-three-dressy-attire-dark-blue-background-adds-touch-sophistication_171965-103068_uptlkd.jpg",
  "https://res.cloudinary.com/dgazqe2qa/image/upload/v1753881664/premium_photo-1682094069738-19a65f3145b9_jvwuca.jpg",
  "https://res.cloudinary.com/dgazqe2qa/image/upload/v1753881871/portrait-of-asian-happy-family-sit-on-sofa-and-smile-look-at-camera-young-couple-parents_zmmyeh.jpg"
]

10.times do |i|
  user = User.create!(
    email: "provider#{i + 1}@example.com",
    password: "password123",
    role: "provider"
  )

  provider = Provider.create!(
    user: user,
    some_provider_fields: "Provider #{i + 1} details"
  )

  family = Family.new(
    members: members_options[i],
    location: locations[i],
    event_type: event_type_options[i],
    hourly_rate: hourly_rate_options[i],
    provider: provider,
    rating: rand(3..5),
    description: descriptions[i]
  )

  file = URI.parse(photo_urls[i]).open
  family.photo.attach(io: file, filename: "#{members_options[i]}.png", content_type: "image/png")
  family.save!
end

puts "🌸 Seeded 10 providers and their beautiful families with special ratings and descriptions!"