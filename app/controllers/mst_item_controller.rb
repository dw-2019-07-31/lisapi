class MstItemController < ApplicationController
  before_action :set_mst_item, only: [:show]

  # GET /mst_item
  def index
    @objects = MstItem.all.paginate(page: params[:page], per_page: @@row_limit)

    render json: @objects
  end

  # GET /mst_item/1
  def show
    render json: @objects
  end

  def filter
    super
    render json: @objects
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mst_item
      @objects = MstItem.where(item_code: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def mst_item_params
      params.fetch(:mst_item, {})
    end
end
