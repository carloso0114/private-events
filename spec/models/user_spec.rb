require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has none to begin with' do
    expect(User.count).to eq 0
  end

  it 'has one after adding one' do
    User.create
    expect(User.count).to eq 1
  end

  it 'has none after one was created in a previous example' do
    expect(User.count).to eq 0
  end
end

RSpec.describe 'Create new event', type: :feature do
  before :each do
    User.create(username: 'carlos')
  end

  it 'signs in and create event' do
    visit login_path
    within('.login-form') do
      fill_in 'Username', with: 'carlos'
    end
    click_button 'Log in'
    visit new_event_path
    fill_in 'Description', with: 'Party'
    click_button 'commit'
    expect(current_path).to eq('/events/1')
  end
end

RSpec.describe 'Create new attendance', type: :feature do
  before :each do
    User.create(username: 'carlos')
  end

  it 'creates a new attendance' do
    visit login_path
    within('.login-form') do
      fill_in 'Username', with: 'carlos'
    end
    click_button 'Log in'
    visit new_event_path
    fill_in 'Description', with: 'Party'
    find("#event_date_1i option[value='2021']").select_option
    find("#event_date_2i option[value='3']").select_option
    find("#event_date_3i option[value='26']").select_option
    click_button 'commit'
    click_button 'commit'
    expect(Attendance.first.user_id).to eq(User.first.id)
    expect(Attendance.first.event_id).to eq(Event.first.id)
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

RSpec.describe 'Sign in test', type: :feature do
  before :each do
    User.create(username: 'carlos')
  end

  it 'signs me in' do
    visit login_path
    within('.login-form') do
      fill_in 'Username', with: 'carlos'
    end
    click_button 'Log in'
    expect(current_path).to eq('/users/1')
  end
end

RSpec.describe 'Sign up test', type: :feature do
  it 'create new account' do
    visit new_user_path
    within('.sign-up-form') do
      fill_in 'Username', with: 'carlos'
    end
    click_button 'Sign Up'
    expect(current_path).to eq('/users/1')
  end
end
