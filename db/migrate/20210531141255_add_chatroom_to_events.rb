class AddChatroomToEvents < ActiveRecord::Migration[6.1]
  def change
    add_reference :events, :chatroom, foreign_key: true
  end
end
