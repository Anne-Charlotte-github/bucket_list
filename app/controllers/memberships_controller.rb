class MembershipsController < ApplicationController
  def create
    membership = Membership.new(user_id: current_user.id, dream_id: params_dream[:id])
    if membership.save!
      redirect_to friendships_path, notice: 'Ok, demande envoyée'
    else
      redirect_to friendships_path, alert: 'Erreur, essaye encore'
    end
  end

  def update
  end

  def destroy
    membership = Membership.find(params_membership[:id])
    membership.delete!
    redirect_to friendships_path, notice: 'Ok, membership supprimée'
  end

  private
  def params_dream
    params.require(:dream).permit(:id)
  end

  def params_membership
    params.require(:membership).permit(:id)
  end
end
