members_options = [
  "The Watanabe Family", "The Sato Clan", "The Nakamura Group", "The Yamamoto Crew",
  "The Kimura Household", "The Fujimoto Siblings", "The Ishikawa Family", "The Takahashi Trio",
  "The Tanaka League", "The Hayashi Circle", "The Mori Party", "The Ogawa Band",
  "The Aoki Assembly", "The Nakano Network", "The Okada Kin", "The Inoue Family",
  "The Sasaki Squad", "The Shimizu Circle", "The Kondo Lineage", "The Hirose Harmony"
]

location_options = ["Tokyo", "Kyoto", "Osaka", "Fukuoka", "Nagoya", "Sapporo", "Hiroshima", "Kobe", "Yokohama", "Sendai", "Kagoshima", "Nagasaki", "Shizuoka", "Chiba", "Okinawa", "Niigata", "Kanazawa", "Nara", "Himeji", "Matsuyama"]

event_type_options = ["Birthday", "Wedding", "Company Picnic", "BBQ Party", "Baby Shower", "Christmas", "Tea Ceremony", "Anniversary", "New Year", "Graduation", "Hanami", "Funeral", "Engagement", "Baby Welcome", "Island Tour", "Homecoming", "Ski Trip", "Cultural Festival", "Family Reunion", "Spring Outing"]

hourly_rate_options = [3000, 5000, 4500, 3200, 2800, 4000, 2500, 3600, 3900, 4100, 3300, 4700, 3550, 2850, 5100, 3400, 4200, 3650, 3900, 3100]

20.times do |i|
  Family.create!(
    members: members_options[i],
    location: location_options[i],
    event_type: event_type_options[i],
    hourly_rate: hourly_rate_options[i],
    user_id: User.pluck(:id).sample || User.create!(email: "guest_#{rand(1000)}@email.com", username: "guest_#{rand(1000)}", password: "password").id
  )
end

puts "🌸 Seeded 20 beautiful families with your special data!"

User.find_or_create_by!(email: "owner@example.com") do |user|
  user.password = "password"
  user.role = "provider"
end

User.find_or_create_by!(email: "guest@example.com") do |user|
  user.password = "password"
  user.role = "guest"
end
