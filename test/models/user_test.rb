require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Kunal", email: "kunal.yadwadkar@gmail.com", password:"foobar",
    password_confirmation:"foobar")
  end

  # test "the truth" do
  #   assert true
  # end
  test "A valid user" do
    assert @user.valid?
  end


  test " Name is not blank " do
    @user.name = " "

    assert_not @user.valid?
  end

  test "email should be present " do
    @user.email = " "
    assert_not @user.valid?
  end

  test "invalid email length shouldn't be alowed " do
    @user.email = "a"*244 + "@gmail.com"
    assert_not @user.valid?
  end


  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]

    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end


  test "email address should be unique" do
    duplicate = @user.dup
    @user.save

    assert_not duplicate.valid?
  end

  test "case insensitive email uniqueness" do
    duplicate = @user.dup
    duplicate.email = @user.email.upcase

    assert_not duplicate.valid?
  end

end
