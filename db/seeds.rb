# Clear existing data if you want fresh start (optional)
Family.destroy_all
Provider.destroy_all
User.where(role: 'provider').destroy_all

10.times do |i|
  # Create a user with role provider
  user = User.create!(
    email: "provider#{i + 1}@example.com",
    password: "password123",
    role: "provider"
  )

  # Create provider linked to user
  provider = Provider.create!(
    user: user,
    some_provider_fields: "Provider #{i + 1} details"
  )

  # Create family linked to provider
  Family.create!(
    members: "Family #{i + 1}",
    location: ["Tokyo", "Osaka", "Kyoto", "Nagoya", "Fukuoka", "Sapporo", "Hiroshima", "Sendai", "Kobe", "Yokohama"].sample,
    event_type: ["Birthday", "Wedding", "Party", "Festival", "Anniversary"].sample,
    hourly_rate: rand(500..5000),
    provider: provider
  )
end