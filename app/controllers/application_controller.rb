class ApplicationController < ActionController::Base
  before_action :set_goods_for_home

  private

  def set_goods_for_home
    @goods = Good.all
  end
end
