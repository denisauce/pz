class CreateSports < ActiveRecord::Migration[7.1]
  def change
    create_table :sports do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.string :total

      t.timestamps
    end
  end
end
