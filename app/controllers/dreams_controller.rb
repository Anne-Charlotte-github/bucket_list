class DreamsController < ApplicationController
  def index
    @dreams = current_user.owned_dreams
  end

  def show
  end
end
