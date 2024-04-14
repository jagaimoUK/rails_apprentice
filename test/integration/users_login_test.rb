require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest

  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: @user.email, password: "invalid"} } 
    assert_not_is_logged_in?
    assert_response :unprocessable_entity
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "login with calid information followed by logout" do 
    post login_path, params: { session; { email: @user.eamil, password: 'password' }}

    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'

  end
end
