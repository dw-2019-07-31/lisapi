class MstBrandController < ApplicationController
  before_action :set_mst_brand, only: [:show]

  # GET /mst_brand
  def index
    @objects = MstBrand.all.paginate(page: params[:page], per_page: @@row_limit)
    render json: @objects
  end

  # GET /mst_brand/1
  def show
    render json: @objects
  end

  def filter
    super
    render json: @objects
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mst_brand
      @objects = MstBrand.where(brand_code: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def mst_brand_params
      params.fetch(:mst_brand, {})
    end
end
