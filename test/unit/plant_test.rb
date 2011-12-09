require 'test_helper'

class PlantTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Plant.new.valid?
  end
end
