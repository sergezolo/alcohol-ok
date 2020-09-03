class CreateSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :steps do |t|
      t.string :step
      t.integer :cocktail_id

      t.timestamps
    end
  end
end
