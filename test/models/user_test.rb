require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not create a new user without an email" do
    user = User.new name: "Wut"
    assert_not user.save, "Saved the user without an email"
  end

  test "should not create a new user without a name" do
    user = User.new email_address: "asd@ad.ds", email_address_confirmation: "asd@ad.ds"
    assert_not user.save, "Saved the user without a name"
  end

  test "should not create a new user with an highly invalid email" do
    %w[ad@ @da ad@ad 444 asdad].each do |addr|
      bob = User.new name: "Yoo", password_digest: create_password
      bob.email_address = addr
      bob.email_address_confirmation = addr
      assert_not bob.save, "Saved bob with an invalid email: #{addr}"
    end
  end

  test "should create a new user with a valid email and username" do
    user = User.new name: "Antoine Jakobs", email_address: "someone@example.com",
        email_address_confirmation: "someone@example.com", password_digest: create_password
    assert user.save, "Didn't save the user with a valid email #{user.errors.messages}"
  end

  test "should not create two users with the same email" do
    user = User.new name: "User1", password: "ayy lmao"
    user.email_address = "test@example.com"
    user.email_address_confirmation = "test@example.com"
    assert user.save, "Did not create a valid user"

    user2 = User.new name: "User2", password: "ayy lmao"
    user2.email_address = "Test@example.com"
    user2.email_address_confirmation = "Test@example.com"
    assert_not user2.save, "Created two users with the same email"
  end

  test "should not create two users with the same name" do
    user = User.new name: "User1", password: "ayy lmaaao"
    user.email_address = "test@example.com"
    user.email_address_confirmation = "test@example.com"
    assert user.save, "Did not create a valid user"

    user2 = User.new name: "uSer1", password: "ayoo lmaaoo"
    user2.email_address = "test2@example.com"
    user2.email_address_confirmation = "test2@example.com"
    assert_not user2.save, "Created two users with the same name"
  end

  test "should not create a new user with an empty password" do
    user = User.new name: "Jo Schmo", email_address: "jo@example.com",
        email_address_confirmation: "joe@example.com", password: ""

    assert_not user.save, "Saved a new user with an empty password"
  end
end
