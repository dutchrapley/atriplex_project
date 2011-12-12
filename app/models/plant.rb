class Plant < ActiveRecord::Base
  attr_accessible :common_name, :genus, :species, :zone, :light, :moisture, :soil_texture, :soil_ph, :form, :height, :width, :root_span, :lifespan, :growth_rate, :native, :edible, :medicinal, :nitrogen_fixer, :ground_cover, :dynamic_accumulator, :nectary, :cover_crop, :seed_stock_sources, :local_examples, :sources, :notes, :insects, :animals, :flavor_profile
end