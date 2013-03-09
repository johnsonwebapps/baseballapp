class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :surname
      t.string :givenname
      t.integer :games
      t.integer :atbats
      t.integer :runs
      t.integer :hits
      t.integer :rbi
      t.integer :pb
      t.integer :walks
      t.integer :struckout
      t.integer :hitbypitch

      t.timestamps
    end
  end
end
