class Api::V1::BestDayController < ApplicationController

  def show
    render json: item.best_day, serializer: ItemBestDaySerializer
  end

  private

  def item
    Item.find(params[:item_id])
  end

end
