require 'test_helper'

class RecentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recent = recents(:one)
  end

  test "should get index" do
    get recents_url
    assert_response :success
  end

  test "should get new" do
    get new_recent_url
    assert_response :success
  end

  test "should create recent" do
    assert_difference('Recent.count') do
      post recents_url, params: { recent: { author: @recent.author, body: @recent.body, title: @recent.title } }
    end

    assert_redirected_to recent_url(Recent.last)
  end

  test "should show recent" do
    get recent_url(@recent)
    assert_response :success
  end

  test "should get edit" do
    get edit_recent_url(@recent)
    assert_response :success
  end

  test "should update recent" do
    patch recent_url(@recent), params: { recent: { author: @recent.author, body: @recent.body, title: @recent.title } }
    assert_redirected_to recent_url(@recent)
  end

  test "should destroy recent" do
    assert_difference('Recent.count', -1) do
      delete recent_url(@recent)
    end

    assert_redirected_to recents_url
  end
end
