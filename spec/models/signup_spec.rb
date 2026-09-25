require "rails_helper"

RSpec.describe Signup, type: :model do
  it "prevents the same user from signing up for an event twice" do
    organizer = User.create!(name: "Org", email: "org@example.com", password: "password123")
    volunteer = User.create!(name: "Vol", email: "vol@example.com", password: "password123")
    event = Event.create!(
      name: "Cleanup", description: "desc", location: "Park", date: 1.week.from_now,
      organizer: organizer, resources: [fixture_file_upload("spec/fixtures/files/sample.pdf", "application/pdf")]
    )

    Signup.create!(user: volunteer, event: event)
    dup = Signup.new(user: volunteer, event: event)

    expect(dup).not_to be_valid
  end
end
