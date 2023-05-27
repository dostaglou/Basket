class HomeController < ApplicationController
  def welcome
    redirect_to basket_items_path if current_user.present?
  end
end
