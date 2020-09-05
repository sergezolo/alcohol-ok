class RemoveStepsFromCocktails < ActiveRecord::Migration[6.0]
  def change
    remove_column :cocktails, :steps, :string
  end
end
