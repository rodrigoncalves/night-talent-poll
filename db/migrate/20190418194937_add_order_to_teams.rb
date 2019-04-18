class AddOrderToTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :order, :integer
  end
end
