class FriendshipsController < ApplicationController
  def index
    @friends = current_user.friends
    @membership = Membership.new(user_id: current_user.id)
  end
end
