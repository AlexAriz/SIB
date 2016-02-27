require 'test_helper'

class UsersWorkMaterialsControllerTest < ActionController::TestCase
  setup do
    @users_work_material = users_work_materials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users_work_materials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create users_work_material" do
    assert_difference('UsersWorkMaterial.count') do
      post :create, users_work_material: {  }
    end

    assert_redirected_to users_work_material_path(assigns(:users_work_material))
  end

  test "should show users_work_material" do
    get :show, id: @users_work_material
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @users_work_material
    assert_response :success
  end

  test "should update users_work_material" do
    patch :update, id: @users_work_material, users_work_material: {  }
    assert_redirected_to users_work_material_path(assigns(:users_work_material))
  end

  test "should destroy users_work_material" do
    assert_difference('UsersWorkMaterial.count', -1) do
      delete :destroy, id: @users_work_material
    end

    assert_redirected_to users_work_materials_path
  end
end
