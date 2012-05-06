class AddNewBooleanFieldsToPlants < ActiveRecord::Migration
  def change
    add_column :plants, :ncover_crop, :boolean, :default => false
    add_column :plants, :nnectary, :boolean, :default => false
    add_column :plants, :ndynamic_accumulator, :boolean, :default => false
    add_column :plants, :nground_cover, :boolean, :default => false
    add_column :plants, :nnitrogen_fixer, :boolean, :default => false
    add_column :plants, :nmedicinal, :boolean, :default => false
    add_column :plants, :nnative, :boolean, :default => false

  end
end
