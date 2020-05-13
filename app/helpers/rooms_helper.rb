module RoomsHelper
  def opponent_user(room)
    entry = room.entries.where.not(user_id: current_user)
    name = entry[0].user.name
    tag.p "#{name}"
  end
 end
