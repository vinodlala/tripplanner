require 'test_helper'

class ThingToDosControllerTest < ActionController::TestCase
  setup do
    @thing_to_do = thing_to_dos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:thing_to_dos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create thing_to_do" do
    assert_difference('ThingToDo.count') do
      post :create, thing_to_do: { age_range: @thing_to_do.age_range, place_id: @thing_to_do.place_id }
    end

    assert_redirected_to thing_to_do_path(assigns(:thing_to_do))
  end

  test "should show thing_to_do" do
    get :show, id: @thing_to_do
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @thing_to_do
    assert_response :success
  end

  test "should update thing_to_do" do
    patch :update, id: @thing_to_do, thing_to_do: { age_range: @thing_to_do.age_range, place_id: @thing_to_do.place_id }
    assert_redirected_to thing_to_do_path(assigns(:thing_to_do))
  end

  test "should destroy thing_to_do" do
    assert_difference('ThingToDo.count', -1) do
      delete :destroy, id: @thing_to_do
    end

    assert_redirected_to thing_to_dos_path
  end
end
