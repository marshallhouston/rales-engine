class Api::V1::MerchantRevenueController < ApplicationController

  def show
    render json: merchant.revenue(params['date']), serializer: MerchantRevenueSerializer
  end

  private

  def merchant
    Merchant.find(params[:merchant_id])
  end

end
