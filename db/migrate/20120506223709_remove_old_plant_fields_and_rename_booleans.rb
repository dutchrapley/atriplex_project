class RemoveOldPlantFieldsAndRenameBooleans < ActiveRecord::Migration
  change_table :plants do |t|
    t.remove :cover_crop, :nectary, :dynamic_accumulator, :ground_cover, :nitrogen_fixer, :medicinal, :native
    t.rename :ncover_crop, :cover_crop
    t.rename :nnectary, :nectary
    t.rename :ndynamic_accumulator, :dynamic_accumulator
    t.rename :nground_cover, :ground_cover
    t.rename :nnitrogen_fixer, :nitrogen_fixer
    t.rename :nmedicinal, :medicinal
    t.rename :nnative, :native
  end
end
