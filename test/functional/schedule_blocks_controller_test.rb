require 'test_helper'

class ScheduleBlocksControllerTest < ActionController::TestCase
  setup do
    @schedule_block = schedule_blocks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schedule_blocks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create schedule_block" do
    assert_difference('ScheduleBlock.count') do
      post :create, schedule_block: @schedule_block.attributes
    end

    assert_redirected_to schedule_block_path(assigns(:schedule_block))
  end

  test "should show schedule_block" do
    get :show, id: @schedule_block.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @schedule_block.to_param
    assert_response :success
  end

  test "should update schedule_block" do
    put :update, id: @schedule_block.to_param, schedule_block: @schedule_block.attributes
    assert_redirected_to schedule_block_path(assigns(:schedule_block))
  end

  test "should destroy schedule_block" do
    assert_difference('ScheduleBlock.count', -1) do
      delete :destroy, id: @schedule_block.to_param
    end

    assert_redirected_to schedule_blocks_path
  end
end
