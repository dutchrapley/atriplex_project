namespace :data do
  desc "add boolean & preserve data"
  task :normalize => :environment do
    puts "moving info into notes"
    plants = Plant.all
    period = ". "
    plants.each do |plant|
      if plant.native
        plant.notes += (period + plant.native) unless plant.native == "x"
        plant.nnative = true
      end
      if plant.medicinal
        plant.notes += (period + plant.medicinal) unless plant.medicinal == "x"
        plant.nmedicinal = true unless plant.medicinal == 'no'
      end
      if plant.nitrogen_fixer
        plant.nnitrogen_fixer = true
      end
      if plant.ground_cover
        plant.nground_cover = true
      end
      if plant.dynamic_accumulator
        plant.ndynamic_accumulator = true
      end
      if plant.nectary
        plant.nnectary = true
      end
      if plant.cover_crop
        plant.ncover_crop = true
      end
      plant.save
    end
  end
end
