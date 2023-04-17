class HomeController < ApplicationController
  def welcome
    @basket_items = policy_scope(BasketItem)
  end
end
