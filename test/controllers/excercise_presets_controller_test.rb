require 'test_helper'

class ExcercisePresetsControllerTest < ActionController::TestCase
  setup do
    @excercise_preset = excercise_presets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:excercise_presets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create excercise_preset" do
    assert_difference('ExcercisePreset.count') do
      post :create, excercise_preset: { name: @excercise_preset.name }
    end

    assert_redirected_to excercise_preset_path(assigns(:excercise_preset))
  end

  test "should show excercise_preset" do
    get :show, id: @excercise_preset
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @excercise_preset
    assert_response :success
  end

  test "should update excercise_preset" do
    patch :update, id: @excercise_preset, excercise_preset: { name: @excercise_preset.name }
    assert_redirected_to excercise_preset_path(assigns(:excercise_preset))
  end

  test "should destroy excercise_preset" do
    assert_difference('ExcercisePreset.count', -1) do
      delete :destroy, id: @excercise_preset
    end

    assert_redirected_to excercise_presets_path
  end
end
