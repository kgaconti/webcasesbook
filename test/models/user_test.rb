require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  test 'a user must enter first_name' do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:first_name].empty?
  end

  test 'a user must enter last_name' do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:last_name].empty?
  end

  test 'a user must enter profile_name' do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test 'a user profile_name must be unique' do
  	user = User.new
  	user.profile_name = users(:kwame).profile_name
	  assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test 'a user profile_name must not have spaces' do
  	user = User.new(first_name: 'abcd', last_name: 'dcba', email: 'a@b.com')
    user.password = user.password_confirmation = 'qwerty'

    user.profile_name = 'My profile with spaces'
	  
    assert !user.save
  	assert !user.errors[:profile_name].empty?
  	assert user.errors[:profile_name].include?('Must have no spaces and fomatted correctly')
  end

  test 'a user a correctly formated profile_name' do
    user = User.new(first_name: 'abcd', last_name: 'dcba', email: 'a@b.com')
    user.password = user.password_confirmation = 'qwerty'

    user.profile_name = 'abcd_dcba-6789'
    assert user.valid?
  end
end
