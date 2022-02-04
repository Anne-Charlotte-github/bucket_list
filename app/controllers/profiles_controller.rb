class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @dreams = @user.owned_dreams
    @friends_dreams = @user.dreams
  end
end
