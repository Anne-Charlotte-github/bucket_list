class CurrentProfileController < ApplicationController
  before_action

  def index
    @dreams = current_user.owned_dreams
    @friends_dreams = current_user.dreams
  end

end
