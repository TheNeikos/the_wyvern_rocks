require 'test_helper'

class ForumTest < ActiveSupport::TestCase
  test "should not be able to create a forum without category" do
    forum = Forum.new name: "Hurr Durr I'm a sheep", order: 0
    assert_not forum.save, "Saved an invalid Forum"
  end

  test "should not be able to create a forum without a name" do
    forum = Forum.new dashboard_category: dashboard_categories(:general), order: 1
    assert_not forum.save, "Saved an invalid Forum"
  end

  test "should be able to create a forum" do
    forum = Forum.new dashboard_category: dashboard_categories(:general), name: "Introductions!", order: 2
    assert forum.save, "Did not save a valid Forum"
  end
end
