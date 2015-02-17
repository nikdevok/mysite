require 'test_helper'

class MethodFilesControllerTest < ActionController::TestCase
  setup do
    @method_file = method_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:method_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create method_file" do
    assert_difference('MethodFile.count') do
      post :create, method_file: { descriprion: @method_file.descriprion }
    end

    assert_redirected_to method_file_path(assigns(:method_file))
  end

  test "should show method_file" do
    get :show, id: @method_file
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @method_file
    assert_response :success
  end

  test "should update method_file" do
    put :update, id: @method_file, method_file: { descriprion: @method_file.descriprion }
    assert_redirected_to method_file_path(assigns(:method_file))
  end

  test "should destroy method_file" do
    assert_difference('MethodFile.count', -1) do
      delete :destroy, id: @method_file
    end

    assert_redirected_to method_files_path
  end
end
