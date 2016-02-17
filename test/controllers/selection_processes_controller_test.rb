require 'test_helper'

class SelectionProcessesControllerTest < ActionController::TestCase
  setup do
    @selection_process = selection_processes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:selection_processes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create selection_process" do
    assert_difference('SelectionProcess.count') do
      post :create, selection_process: { activities: @selection_process.activities, deadline: @selection_process.deadline, link: @selection_process.link, university_name: @selection_process.university_name }
    end

    assert_redirected_to selection_process_path(assigns(:selection_process))
  end

  test "should show selection_process" do
    get :show, id: @selection_process
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @selection_process
    assert_response :success
  end

  test "should update selection_process" do
    patch :update, id: @selection_process, selection_process: { activities: @selection_process.activities, deadline: @selection_process.deadline, link: @selection_process.link, university_name: @selection_process.university_name }
    assert_redirected_to selection_process_path(assigns(:selection_process))
  end

  test "should destroy selection_process" do
    assert_difference('SelectionProcess.count', -1) do
      delete :destroy, id: @selection_process
    end

    assert_redirected_to selection_processes_path
  end
end
