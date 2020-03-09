class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :title
      t.integer :style

      t.timestamps
    end
  end
end
