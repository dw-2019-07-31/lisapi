require 'test_helper'

class MstItemControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mst_item = mst_item(:one)
  end

  test "should get index" do
    get mst_item_index_url, as: :json
    assert_response :success
  end

  test "should create mst_item" do
    assert_difference('MstItem.count') do
      post mst_item_index_url, params: { mst_item: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show mst_item" do
    get mst_item_url(@mst_item), as: :json
    assert_response :success
  end

  test "should update mst_item" do
    patch mst_item_url(@mst_item), params: { mst_item: {  } }, as: :json
    assert_response 200
  end

  test "should destroy mst_item" do
    assert_difference('MstItem.count', -1) do
      delete mst_item_url(@mst_item), as: :json
    end

    assert_response 204
  end
end
