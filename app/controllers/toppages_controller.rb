class ToppagesController < ApplicationController
  def index
    @items = Item.order('update_at DESC')
  end
end
