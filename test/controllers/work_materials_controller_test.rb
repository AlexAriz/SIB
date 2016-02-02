require 'test_helper'

class WorkMaterialsControllerTest < ActionController::TestCase
  setup do
    @work_material = work_materials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:work_materials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create work_material" do
    assert_difference('WorkMaterial.count') do
      post :create, work_material: { description: @work_material.description, file_src: @work_material.file_src, name: @work_material.name, tutor_id: @work_material.tutor_id }
    end

    assert_redirected_to work_material_path(assigns(:work_material))
  end

  test "should show work_material" do
    get :show, id: @work_material
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @work_material
    assert_response :success
  end

  test "should update work_material" do
    patch :update, id: @work_material, work_material: { description: @work_material.description, file_src: @work_material.file_src, name: @work_material.name, tutor_id: @work_material.tutor_id }
    assert_redirected_to work_material_path(assigns(:work_material))
  end

  test "should destroy work_material" do
    assert_difference('WorkMaterial.count', -1) do
      delete :destroy, id: @work_material
    end

    assert_redirected_to work_materials_path
  end
end
