require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "should allow valid email" do
    assert_match /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/, "email@test.com"
  end

  test "should prevent invalid email" do
    assert_no_match /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/, "email@test"
  end
end
