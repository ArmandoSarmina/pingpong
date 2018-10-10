class AddIdsToGames < ActiveRecord::Migration
  def change
    add_column :games, :player_id, :integer
    add_column :games, :opponent_id, :integer
  end
end
