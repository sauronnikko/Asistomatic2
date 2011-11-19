require 'test_helper'

class JustificationsControllerTest < ActionController::TestCase
  setup do
    @justification = justifications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:justifications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create justification" do
    assert_difference('Justification.count') do
      post :create, justification: @justification.attributes
    end

    assert_redirected_to justification_path(assigns(:justification))
  end

  test "should show justification" do
    get :show, id: @justification.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @justification.to_param
    assert_response :success
  end

  test "should update justification" do
    put :update, id: @justification.to_param, justification: @justification.attributes
    assert_redirected_to justification_path(assigns(:justification))
  end

  test "should destroy justification" do
    assert_difference('Justification.count', -1) do
      delete :destroy, id: @justification.to_param
    end

    assert_redirected_to justifications_path
  end
end
