require 'test_helper'

class BlogPostTest < ActiveSupport::TestCase
  test "should not be able to create a blog post without a blog" do
    bp = BlogPost.new user: users(:bob), name: "Yoooo", content: "Is this working?", published: false
    assert_not bp.save, "Saved an invalid blog_post"
  end

  test "should not be able to create a blog post without a name" do
    bp = BlogPost.new user: users(:bob), blog: blogs(:mariesblog), content: "Is this working?", published: false
    assert_not bp.save, "Saved an invalid blog_post"
  end

  test "should not be able to create a blog post without content" do
    bp = BlogPost.new user: users(:bob), blog: blogs(:mariesblog), name: "Nope!?", published: false
    assert_not bp.save, "Saved an invalid blog_post"
  end

  test "should be able to create a blog post" do
    bp = BlogPost.new user: users(:bob), blog: blogs(:mariesblog), name: "Nope!?", content: "First post!", published: false
    assert bp.save, "Did not save an valid blog_post"
  end
end
