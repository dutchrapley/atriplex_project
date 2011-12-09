require 'test_helper'

class PlantsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Plant.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Plant.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Plant.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to plant_url(assigns(:plant))
  end

  def test_edit
    get :edit, :id => Plant.first
    assert_template 'edit'
  end

  def test_update_invalid
    Plant.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Plant.first
    assert_template 'edit'
  end

  def test_update_valid
    Plant.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Plant.first
    assert_redirected_to plant_url(assigns(:plant))
  end

  def test_destroy
    plant = Plant.first
    delete :destroy, :id => plant
    assert_redirected_to plants_url
    assert !Plant.exists?(plant.id)
  end
end
