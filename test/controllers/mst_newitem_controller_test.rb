require 'test_helper'

class MstNewitemControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mst_newitem = mst_newitem(:one)
  end

  test "should get index" do
    get mst_newitem_index_url, as: :json
    assert_response :success
  end

  test "should create mst_newitem" do
    assert_difference('MstNewitem.count') do
      post mst_newitem_index_url, params: { mst_newitem: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show mst_newitem" do
    get mst_newitem_url(@mst_newitem), as: :json
    assert_response :success
  end

  test "should update mst_newitem" do
    patch mst_newitem_url(@mst_newitem), params: { mst_newitem: {  } }, as: :json
    assert_response 200
  end

  test "should destroy mst_newitem" do
    assert_difference('MstNewitem.count', -1) do
      delete mst_newitem_url(@mst_newitem), as: :json
    end

    assert_response 204
  end
end
