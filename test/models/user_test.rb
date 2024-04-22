require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name: "Emi", email: "emi@a.com", password: "fooooo", password_confirmation: "fooooo")
  end

  test "should be valid" do 
    assert @user.valid?
  end 
  # test "the truth" do
  #   assert true
  # end
  # test "name should be present" do
  #   @user.name = "     "
  #   assert_not @user.valid?
  # end

  test "password should be present (nonblank)]" do
    @user.password = @user.password_confirmation = '' * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = 'a' * 5
    assert_not @user.valid?
  end
end
