require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name: "Example User ", email: "user@example.com", password: "mailinh", password_confirmation: "mailinh")
  end

  test "should be valid" do
    assert @user.valid?
  end 
  test "name should be present" do
    @user.name = "  "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "  "
    assert_not @user.valid?
  end

  test "name should not be too long" do 
    @user.name = "a"*51
    assert_not @user.valid?
  end

  test "email should be too long" do 
    @user.email = "a"*244 + "@example.com"
    assert_not @user.valid?
  end

  test "email should be unique" do 
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email should be saved as lowercase" do 
    mix_case_email = "Fpp@Example.COM"
    @user.email = mix_case_email
    @user.save
    assert_equal mix_case_email.downcase, @user.reload.email
  end
  test "password should be present (nonblank)" do 
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end
  test "password should have a minimum length" do 
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
end
