require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest
  
  test "that /login opens the log in page" do
  	get '/login'
  	assert_response :success    
  end

  test "that /logout opens the log out page" do
  	get '/logout'
  	assert_response :redirect
  	assert_redirected_to '/'    
  end

  test "that /register opens the register page" do
  	get '/register'
  	assert_response :success    
  end
end
