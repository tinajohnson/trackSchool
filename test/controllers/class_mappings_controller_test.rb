require 'test_helper'

class ClassMappingsControllerTest < ActionController::TestCase
  setup do
    @class_mapping = class_mappings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:class_mappings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create class_mapping" do
    assert_difference('ClassMapping.count') do
      post :create, class_mapping: {  }
    end

    assert_redirected_to class_mapping_path(assigns(:class_mapping))
  end

  test "should show class_mapping" do
    get :show, id: @class_mapping
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @class_mapping
    assert_response :success
  end

  test "should update class_mapping" do
    patch :update, id: @class_mapping, class_mapping: {  }
    assert_redirected_to class_mapping_path(assigns(:class_mapping))
  end

  test "should destroy class_mapping" do
    assert_difference('ClassMapping.count', -1) do
      delete :destroy, id: @class_mapping
    end

    assert_redirected_to class_mappings_path
  end
end
