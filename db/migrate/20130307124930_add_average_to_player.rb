class AddAverageToPlayer < ActiveRecord::Migration
  def self.up
    add_column :players, :average, :integer
  end

  def self.down
    remove_column :players, :average
  end
end
