class CreateVotings < ActiveRecord::Migration[5.1]
  def change
    create_table :votings do |t|
      t.column :status, :integer, default: 0

      t.timestamps
    end
  end
end
