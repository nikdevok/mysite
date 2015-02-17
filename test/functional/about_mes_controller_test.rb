require 'test_helper'

class AboutMesControllerTest < ActionController::TestCase
  setup do
    @about_me = about_mes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:about_mes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create about_me" do
    assert_difference('AboutMe.count') do
      post :create, about_me: { body: @about_me.body }
    end

    assert_redirected_to about_me_path(assigns(:about_me))
  end

  test "should show about_me" do
    get :show, id: @about_me
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @about_me
    assert_response :success
  end

  test "should update about_me" do
    put :update, id: @about_me, about_me: { body: @about_me.body }
    assert_redirected_to about_me_path(assigns(:about_me))
  end

  test "should destroy about_me" do
    assert_difference('AboutMe.count', -1) do
      delete :destroy, id: @about_me
    end

    assert_redirected_to about_mes_path
  end
end
