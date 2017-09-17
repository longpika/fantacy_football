class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.decimal :ranking, default: 0, precision: 10, scale: 2
      t.timestamps
    end
  end
end
