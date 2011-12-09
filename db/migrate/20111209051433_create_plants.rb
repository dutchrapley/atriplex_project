class CreatePlants < ActiveRecord::Migration
  def self.up
    create_table :plants do |t|
      t.string :common_name
      t.string :genus
      t.string :species
      t.string :zone
      t.string :light
      t.string :moisture
      t.string :soil_texture
      t.string :soil_ph
      t.string :form
      t.string :height
      t.string :width
      t.string :root_span
      t.string :lifespan
      t.string :growth_rate
      t.string :native
      t.string :edible
      t.string :medicinal
      t.string :nitrogen_fixer
      t.string :ground_cover
      t.string :dynamic_accumulator
      t.string :nectary
      t.string :cover_crop
      t.string :seed_stock_sources
      t.string :local_examples
      t.string :sources
      t.text :notes
      t.string :insects
      t.string :animals
      t.string :flavor_profile
      t.timestamps
    end
  end

  def self.down
    drop_table :plants
  end
end
