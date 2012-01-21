namespace :atriplex do
  desc "Import google doc"
  task :import_google_doc => :environment do
    puts "Pulling Records"
    require 'csv'
    @parsed_file = CSV.parse(File.open("#{Rails.root}/doc/atriplex_google_doc.csv"))

=begin    
    LEGACY FIELDS
      0 Common Name,
      1 Genus,
      2 Species,
      3 Zones,
      4 Light,
      5 Moisture,
      6 Soil texture,
      6 Soil pH,
      7 Form,
      8 Height,
      9 Width,
      10 Root Span,
      11 Lifespan,
      12 Growth Rate,
      13 Native?,
      14 Edible?,
      15 Medicinal?,
      16 Nitrogen fixer?,
      17 Ground cover?,
      18 Dynamic Accumulator?,
      19 Nectary?,
      20 Cover crop?,
      21 Seed/stock Sources (see tab 2 for key),
      22 Local examples,
      23 Sources,
      24 Notes,
      25 Insects,
      26 Animals,
      27 ,
      28 If Edible: Flavor Profile
=end
     
    @parsed_file.each_with_index  do |row, x|
      if x != 0
        puts "attempting #{row[0]}"
        p = Plant.new
        
        p.common_name = row[0]
        p.genus= row[1]
        p.species= row[2]
        p.zone= row[3]
        p.light= row[4]
        p.moisture= row[5]
        p.soil_texture= row[6]
        p.soil_ph= row[7]
        p.form= row[8]
        p.height= row[9]
        p.width= row[10]
        p.root_span= row[11]
        p.lifespan= row[12]
        p.growth_rate= row[13]
        p.native= row[14]
        p.edible= row[15]
        p.medicinal= row[16]
        p.nitrogen_fixer= row[17]
        p.ground_cover= row[18]
        p.dynamic_accumulator= row[19]
        p.nectary= row[20]
        p.cover_crop= row[21]
        p.seed_stock_sources= row[22]
        p.local_examples= row[23]
        p.sources= row[24]
        p.notes= row[25]
        p.insects= row[26]
        p.animals= row[27]
        p.flavor_profile= row[29]
        
        if p.save
          puts "#{row[0]} success"
        else
          puts "ERROR ERROR ERROR #{row[0]}"
        end
      end
    end
  end
  task :import_google_doc => :environment do
    @plants = Plants.all

    @plants.each do |plant|
      
    end
  end
end
