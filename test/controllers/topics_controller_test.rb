require 'test_helper'

class TopicsControllerTest < ActionController::TestCase
  setup do
    @topic = topics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:topics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create topic" do
    assert_difference('Topic.count') do
      post :create, topic: { description: @topic.description, title: @topic.title }
    end 
    assert_redirected_to topics_path
  end

  test "should show topic" do
    get :show, id: @topic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @topic
    assert_response :success
  end

  test "should update topic" do
    patch :update, id: @topic, topic: { description: @topic.description, title: @topic.title }
    assert_redirected_to topics_path
  end

  test "should destroy topic" do
    assert_difference('Topic.count', -1) do
      delete :destroy, id: @topic
    end

    assert_redirected_to topics_path
  end

  test "should create vote" do 
    assert_difference('@topic.votes.count') do
      post :upvote, id: @topic
    end
    assert_redirected_to topics_path
  end

  test "should create downvote" do
    assert_difference('@topic.downvotes.count') do
      post :downvote, id: @topic
    end
    assert_redirected_to(topics_path)
  end
end
