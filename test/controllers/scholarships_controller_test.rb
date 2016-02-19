# == Schema Information
#
# Table name: scholarships
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  university_id    :integer
#  start_date       :date
#  end_date         :date
#  description      :text(65535)
#  requirements     :text(65535)
#  benefits_offered :text(65535)
#  url              :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_scholarships_on_university_id  (university_id)
#
# Foreign Keys
#
#  fk_rails_4c78106536  (university_id => universities.id)
#

require 'test_helper'

class ScholarshipsControllerTest < ActionController::TestCase
  setup do
    @scholarship = scholarships(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scholarships)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scholarship" do
    assert_difference('Scholarship.count') do
      post :create, scholarship: { benefits_offered: @scholarship.benefits_offered, description: @scholarship.description, end_date: @scholarship.end_date, name: @scholarship.name, requirements: @scholarship.requirements, start_date: @scholarship.start_date, university_id: @scholarship.university_id, url: @scholarship.url }
    end

    assert_redirected_to scholarship_path(assigns(:scholarship))
  end

  test "should show scholarship" do
    get :show, id: @scholarship
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scholarship
    assert_response :success
  end

  test "should update scholarship" do
    patch :update, id: @scholarship, scholarship: { benefits_offered: @scholarship.benefits_offered, description: @scholarship.description, end_date: @scholarship.end_date, name: @scholarship.name, requirements: @scholarship.requirements, start_date: @scholarship.start_date, university_id: @scholarship.university_id, url: @scholarship.url }
    assert_redirected_to scholarship_path(assigns(:scholarship))
  end

  test "should destroy scholarship" do
    assert_difference('Scholarship.count', -1) do
      delete :destroy, id: @scholarship
    end

    assert_redirected_to scholarships_path
  end
end
