require "rails_helper"
require "spec_helper"



# Disable Transactions
RSpec.configure do |c|
  c.use_transactional_examples = false
  c.use_transactional_fixtures = false
  c.order = "defined"
end

# RSpec.describe User, :type => :model do
#   it "has none to begin with" do
#     expect(User.count).to eq 0
#   end

#   it "has one after adding one" do
#     User.create
#     expect(User.count).to eq 1
#   end

#   it "has none after one was created in a previous example" do
#     expect(User.count).to eq 0
#   end
# end


RSpec.describe User, :type => :model do
  it "has none to begin with" do
    expect(User.count).to eq 0
  end

  it "has one after adding one" do
    User.create
    expect(User.count).to eq 1
  end

  it "has one after one was created in a previous example" do
    expect(User.count).to eq 1
  end

  after(:all) { User.destroy_all }
end