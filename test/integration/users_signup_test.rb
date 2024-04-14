require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "valid signup information" do 
    assert_difference 'User.count', 1 do
      post users_path, params: { user: {
        name: "a",
        email: "a@a.com",
        password: "a",
        password_confirmation: "a" 
        }
      }
    end
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end
end
