class MstNewitemController < ApplicationController
  before_action :set_mst_newitem, only: [:show, :update, :destroy]

  def filter
    @objects = nil
    super
  end

  # GET /mst_newitem
  def index
    @objects = MstNewitem.all.paginate(page: params[:page], per_page: @@row_limit) if @objects.nil?

    render json: @objects
  end

  def progress

    filter
    @newitems = @objects.select("item_code
                                , status
                                , launch_month
                                , brand_name
                                , tentative_item_name
                                , tentative_standard
                                , image_path
                                , contact_person_at_ott
                                , (nvl2(decision_date_for_launch, 1, 0) 
                                + nvl2(item_name, 1, 0)
                                + nvl2(retail, 1, 0) 
                                + nvl2(requested_date_of_test_sample, 1, 0) 
                                + nvl2(arrival_date_of_test_sample, 1, 0) 
                                + nvl2(requested_date_of_sales_sample, 1, 0) 
                                + nvl2(arrival_date_of_sales_sample, 1, 0) 
                                + nvl2(bom_requested_date, 1, 0) 
                                + nvl2(bom_arrival_date, 1, 0) 
                                + nvl2(bom_check, 1, 0) 
                                + nvl2(req_date_of_test_rep, 1, 0) 
                                + nvl2(arrival_date_of_test_rep, 1, 0) 
                                + nvl2(test_rep_check, 1, 0) 
                                + nvl2(caution_and_material, 1, 0) 
                                + nvl2(pass_date_jpn_test, 1, 0) 
                                + nvl2(image_receive_date, 1, 0) 
                                + nvl2(order_deadline, 1, 0) 
                                + nvl2(order_date, 1, 0) 
                                + nvl2(rrr_regist, 1, 0) 
                                + nvl2(order_date_to_bpg, 1, 0) 
                                + nvl2(end_date_of_artwork, 1, 0) 
                                + nvl2(proof_check_date, 1, 0) 
                                + nvl2(item_db_regist, 1, 0)) /23*100 as percent_complete"
    )

    #percent_completeを小数点第二位以下で四捨五入してパーセント表示
    @newitems.each do |newitem|
      newitem['percent_complete'] = newitem['percent_complete'].round(1).to_s + '%'
    end

    render json: @newitems
  end

  def new_brand_list
    @newbrand_list = MstNewitem.select("brand_name").group(:brand_name).order("brand_name")
    render json: @newbrand_list
  end

  # GET /mst_newitem/1
  def show
    render json: @objects
  end

  # PATCH/PUT /mst_newitem/1
  def update
    if @objects.update(mst_newitem_params)
      render json: @objects
    else
      render json: @objects.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mst_newitem
      @objects = MstNewitem.find(params[:item_code])
    end

    # Only allow a trusted parameter "white list" through.
    def mst_newitem_params
      params.fetch(:mst_newitem, {})
    end
end
