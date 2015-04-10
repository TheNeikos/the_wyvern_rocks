require 'test_helper'

class BlogTest < ActiveSupport::TestCase
  test "should not be able to create a blog without a user" do
    blog = Blog.new name: "Testing", description: "N/A"

    assert_not blog.save, "it saved an invalid blog"
  end

  test "should not  be able to create a blog without a name" do
    blog = Blog.new user: users(:bob), description: "N/A"

    assert_not blog.save, "it saved an invalid blog"
  end

  test "should be able to create a blog without a description" do
    blog = Blog.new user: users(:bob), name: "name!"

    assert blog.save, "it didn't save an valid blog"
  end

  test "should be able to create a blog" do
    blog = Blog.new user: users(:marie), name: "Marie's blog!", description: "Ayy"

    assert blog.save
  end
end
