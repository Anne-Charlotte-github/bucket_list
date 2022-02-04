module FriendshipsHelper
  def membership_action(dream)
    membership = current_user.memberships.find_by(dream_id: dream.id)
    if !membership.nil?
      membership.is_confirmed == false ? '⌛️' : '✅'
    else
      '➕'
    end
  end
  def path_and_method_for_action(action, instance="")
    @membership = current_user.memberships.find_by(dream_id: dream.id)
    if action == '➕️'
      # memberships_path(dream: {id: @dream.id}), method: 'POST'
    elsif action == '⌛️'
      # membership_path(@membership}, method: 'DELETE'
    end
  end
end
