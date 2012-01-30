require 'test_helper'

class PlantTest < ActiveSupport::TestCase
  fixtures :plants
  def setup
    @plant_one = plants(:one)
    @plant_three = plants(:three)
  end

  def test_validates_presence_of_common_name
    @plant_one.common_name = nil
    assert !@plant_one.save
  end

  def test_validates_presence_of_genus
    @plant_one.genus = nil
    assert !@plant_one.save
  end

  def validates_presence_of_species
    @plant_one.species = nil
    assert !@plant_one.save
  end

  def validates_uniqueness_of_common_name
    @plant_three.common_name = "Amaranth"
    assert !@plant_three.save
  end
end
