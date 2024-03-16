class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def prices
  end

  def about
  end
end
