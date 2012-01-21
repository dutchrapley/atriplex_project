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
    sign_in users(:john)
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    sign_in users(:john)
    Plant.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    sign_in users(:john)
    Plant.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to plant_url(assigns(:plant))
  end

  def test_edit
    sign_in users(:john)
    get :edit, :id => Plant.first
    assert_template 'edit'
  end

  def test_user_is_editor
    sign_in users(:non_editor)
    get :edit, :id => Plant.first
    assert_redirected_to new_user_session_path
  end

  def test_update_invalid
    sign_in users(:john)
    Plant.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Plant.first
    assert_template 'edit'
  end

  def test_update_valid
    sign_in users(:john)
    Plant.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Plant.first
    assert_redirected_to plant_url(assigns(:plant))
  end

  def test_destroy
    sign_in users(:john)
    plant = Plant.first
    delete :destroy, :id => plant
    assert_redirected_to plants_url
    assert !Plant.exists?(plant.id)
  end
end
