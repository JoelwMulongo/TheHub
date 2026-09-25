require "rails_helper"

RSpec.describe User, type: :model do
  it "requires a name and a unique email" do
    user = User.new(email: "a@example.com", password: "password123")
    expect(user).not_to be_valid
    expect(user.errors[:name]).to be_present
  end

  it "is valid with a name, email, and password" do
    user = User.new(name: "Ada", email: "ada@example.com", password: "password123")
    expect(user).to be_valid
  end
end
