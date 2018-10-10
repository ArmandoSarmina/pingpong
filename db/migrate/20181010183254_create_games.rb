class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.datetime :date_played
      t.string :opponent
      t.integer :my_score
      t.integer :other_score

      t.timestamps null: false
    end
  end
end
