require 'test_helper'

class DashboardCategoryTest < ActiveSupport::TestCase
  test "should not be able to create a category without name" do
    dc = DashboardCategory.new order: 0
    assert_not dc.save, "Saved an invalid DashboardCategory"
  end

  test "should not be able to create a category without order" do
    dc = DashboardCategory.new name: "Yoo"
    assert_not dc.save, "Saved an invalid DashboardCategory"
  end

  test "should not be able to create a category with the same order" do
    order = 1
    dc = DashboardCategory.new name: "Yoo", order: order
    assert dc.save, "Did not save a valid DashboardCategory #{dc.errors.messages}"

    dc = DashboardCategory.new name: "Another Yoo", order: order
    assert_not dc.save, "Saved an invalid DashboardCategory"
  end

  test "should be able to create a category" do
    dc = DashboardCategory.new name: "Ayyooo", order: 2
    assert dc.save, "Did not save a valid DashboardCategory #{dc.errors.messages}"
  end
end
