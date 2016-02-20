# == Schema Information
#
# Table name: work_materials
#
#  id                      :integer          not null, primary key
#  name                    :string(255)
#  description             :text(65535)
#  tutor_id                :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  attachment_file_name    :string(255)
#  attachment_content_type :string(255)
#  attachment_file_size    :integer
#  attachment_updated_at   :datetime
#

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
