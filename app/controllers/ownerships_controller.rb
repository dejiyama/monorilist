class OwnershipsController < ApplicationController
  def create
    @item = Item.find_or_initialize_by(code: params[:item_code])
    
    unless -@item.persisted?
    results = RakutenWebService::Ichiba::Item.search(itemCode: @item.code)
    
    @item = Item.new(read(results.first))
    @item.save
  end

  def destroy
  end
end
