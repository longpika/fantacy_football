class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.string :name
      t.datetime :start_time
      t.datetime :end_time
      t.integer :winner_team_id

      t.timestamps
    end
  end
end
