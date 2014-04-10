require 'test_helper'

class HistoricoPostsControllerTest < ActionController::TestCase
  setup do
    @historico_post = historico_posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:historico_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create historico_post" do
    assert_difference('HistoricoPost.count') do
      post :create, historico_post: { id_post: @historico_post.id_post, text: @historico_post.text, title: @historico_post.title }
    end

    assert_redirected_to historico_post_path(assigns(:historico_post))
  end

  test "should show historico_post" do
    get :show, id: @historico_post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @historico_post
    assert_response :success
  end

  test "should update historico_post" do
    patch :update, id: @historico_post, historico_post: { id_post: @historico_post.id_post, text: @historico_post.text, title: @historico_post.title }
    assert_redirected_to historico_post_path(assigns(:historico_post))
  end

  test "should destroy historico_post" do
    assert_difference('HistoricoPost.count', -1) do
      delete :destroy, id: @historico_post
    end

    assert_redirected_to historico_posts_path
  end
end
