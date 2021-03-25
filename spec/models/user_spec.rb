require "rails_helper"

RSpec.describe User, :type => :model do
  it "has none to begin with" do
    expect(User.count).to eq 0
  end

  it "has one after adding one" do
    User.create
    expect(User.count).to eq 1
  end

  it "has none after one was created in a previous example" do
    expect(User.count).to eq 0
  end
end

RSpec.describe Attendance, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:event) }
end

RSpec.describe Event, type: :model do
  it { should have_many(:attendances) }
  it { should have_many(:attendees) }
  it { should belong_to(:creator) }
end

RSpec.describe User, type: :model do
  it { should have_many(:created_events) }
  it { should have_many(:attendances) }
  it { should have_many(:attended_events) }
end

# RSpec.describe 'Open Browser test', type: :feature do
#   scenario 'Sign up page' do
#     visit new_user_path
#     sleep(10)
#     expect(page).to have_content('Navbar\nEvents       New Event       Back      \nLog in       Sign up\nSign up\nUsername')
#   end
# end

# RSpec.describe 'Open Browser test', type: :feature do
#   scenario 'Sign up page' do   
#       visit new_user_path
#       fill_in "Username", :with => 'carlos'
#       click_button "Sign Up"
#       gets 'users_path'
#       response.should be_success
#   end
# end