# Clear existing data if you want a fresh start (optional)
Family.destroy_all
Provider.destroy_all
User.where(role: 'provider').destroy_all

members_options = [
  "The Watanabe Family", "The Sato Clan", "The Nakamura Group", "The Yamamoto Crew",
  "The Kimura Household", "The Fujimoto Siblings", "The Ishikawa Family", "The Takahashi Trio",
  "The Tanaka League", "The Hayashi Circle"
]

locations = ["Tokyo", "Osaka", "Kyoto", "Nagoya", "Fukuoka", "Sapporo", "Hiroshima", "Sendai", "Kobe", "Yokohama"]

event_type_options = ["Birthday", "Wedding", "Company Picnic", "BBQ Party", "Baby Shower", "Christmas", "Tea Ceremony", "Anniversary", "New Year", "Graduation"]

hourly_rate_options = [3000, 5000, 4500, 3200, 2800, 4000, 2500, 3600, 3900, 4100]

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

  Family.create!(
    members: members_options[i],
    location: locations[i],
    event_type: event_type_options[i],
    hourly_rate: hourly_rate_options[i],
    provider: provider
  )
end

puts "🌸 Seeded 10 providers and their beautiful families with your special names!"