class AddUserIdToSports < ActiveRecord::Migration[7.1]
  def change
    add_reference :sports, :user, null: false, foreign_key: true
  end
end
