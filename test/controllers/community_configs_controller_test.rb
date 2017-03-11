require 'test_helper'

class CommunityConfigsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @community_config = community_configs(:one)
  end

  test "should get index" do
    get community_configs_url
    assert_response :success
  end

  test "should get new" do
    get new_community_config_url
    assert_response :success
  end

  test "should create community_config" do
    assert_difference('CommunityConfig.count') do
      post community_configs_url, params: { community_config: { about: @community_config.about, backgroundOne: @community_config.backgroundOne, backgroundThree: @community_config.backgroundThree, backgroundTwo: @community_config.backgroundTwo, description: @community_config.description, name: @community_config.name } }
    end

    assert_redirected_to community_config_url(CommunityConfig.last)
  end

  test "should show community_config" do
    get community_config_url(@community_config)
    assert_response :success
  end

  test "should get edit" do
    get edit_community_config_url(@community_config)
    assert_response :success
  end

  test "should update community_config" do
    patch community_config_url(@community_config), params: { community_config: { about: @community_config.about, backgroundOne: @community_config.backgroundOne, backgroundThree: @community_config.backgroundThree, backgroundTwo: @community_config.backgroundTwo, description: @community_config.description, name: @community_config.name } }
    assert_redirected_to community_config_url(@community_config)
  end

  test "should destroy community_config" do
    assert_difference('CommunityConfig.count', -1) do
      delete community_config_url(@community_config)
    end

    assert_redirected_to community_configs_url
  end
end
