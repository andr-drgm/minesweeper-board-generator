class CreateTables < ActiveRecord::Migration[8.0]
  def change
    create_table :tables do |t|
      t.string :email
      t.string :title
      t.integer :width
      t.integer :height
      t.integer :mines
      t.string :board_data

      t.timestamps
    end
  end
end
