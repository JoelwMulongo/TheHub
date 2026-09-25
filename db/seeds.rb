organizer = User.find_or_create_by!(email: "organizer@example.com") do |u|
  u.name = "Sam Organizer"
  u.password = "password123"
end

Event.find_or_create_by!(name: "Beach Cleanup") do |e|
  e.description = "Help clean up the local beach for a few hours."
  e.location = "Riverside Beach"
  e.date = 2.weeks.from_now
  e.organizer = organizer
end
