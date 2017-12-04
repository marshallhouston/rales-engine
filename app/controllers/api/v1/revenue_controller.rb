class Api::V1::RevenueController < ApplicationController

  def show
    render json: merchant.revenue(params['date']), serializer: MerchantRevenueSerializer
  end

  private

  def merchant
    Merchant.find(params[:merchant_id])
  end

end
