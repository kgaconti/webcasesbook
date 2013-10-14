require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  
  test 'that status requires content' do
  	status = Status.new
  	assert !status.save
  	assert !status.errors[:content].empty?
  end

  test "that status content's length must be at least 2 charaters" do
  	status = Status.new
  	status.content = 'H'
  	assert !status.save
  	assert !status.errors[:content].empty?
  end

  test "that status has a user id" do
  	status = Status.new
  	status.content = "Hello"
  	assert !status.save
  	assert !status.errors[:user_id].empty?
  end

end
