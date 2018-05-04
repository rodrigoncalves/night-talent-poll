class CreatePolls < ActiveRecord::Migration[5.1]
  def change
    create_table :polls do |t|
      t.string :code
      t.integer :team_id

      t.timestamps
    end
  end
end
