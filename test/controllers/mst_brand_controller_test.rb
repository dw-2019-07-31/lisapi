require 'test_helper'

class MstBrandControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mst_brand = mst_brand(:one)
  end

  test "should get index" do
    get mst_brand_index_url, as: :json
    assert_response :success
  end

  test "should create mst_brand" do
    assert_difference('MstBrand.count') do
      post mst_brand_index_url, params: { mst_brand: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show mst_brand" do
    get mst_brand_url(@mst_brand), as: :json
    assert_response :success
  end

  test "should update mst_brand" do
    patch mst_brand_url(@mst_brand), params: { mst_brand: {  } }, as: :json
    assert_response 200
  end

  test "should destroy mst_brand" do
    assert_difference('MstBrand.count', -1) do
      delete mst_brand_url(@mst_brand), as: :json
    end

    assert_response 204
  end
end
