require "open-uri"

Instrument.destroy_all
User.destroy_all


5.times do
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    address: Faker::Address.full_address,
    password: 123_456,
    password_confirmation: 123_456
  )

  2.times do
    instrument = Instrument.new(
      name: Faker::Music.instrument,
      description: Faker::Lorem.sentence(word_count: 45),
      price: rand(80..240)
    )

    file = URI.open("https://source.unsplash.com/random/?instrument")
    instrument.photo.attach(io: file, filename: "#{instrument.name}.png", content_type: "image/png")
    instrument.user = user
    instrument.save
  end
end
puts "seed created"
