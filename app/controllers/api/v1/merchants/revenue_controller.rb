class Api::V1::Merchants::RevenueController < ApplicationController

  before_action :format_date

  def index
    render json: Merchant.total_revenue(params["date"]).to_s, serializer: MerchantTotalRevenueByDateSerializer
  end

  private

  def format_date
    params["date"] = params["date"].to_datetime
  end

end
