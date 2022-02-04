class CurrentProfileController < ApplicationController

  def index
    @dreams = current_user.owned_dreams
    @friends_dreams = current_user.dreams
  end

end
