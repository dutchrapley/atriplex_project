class PlantsController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show, :search, :browse, :learn]
  before_filter :require_admin, :only => :destroy
  before_filter :require_editor, :except => [:index, :show, :search, :browse, :learn]
  before_filter :find_plant, :except => [:index, :search, :new, :create, :browse, :learn]
  before_filter :search_array
  respond_to :html, :json

  def index
    @plants = Plant.all
    respond_with(@plants)
  end

  def search
    if params[:search].blank?
      @plants = Plant.all
    else
      @plants = Plant.search params[:search]
    end
    respond_with(@plants)
  end

  def browse
    @plants = Plant.all
    respond_with(@plants)
  end

  def show
    first_wiki_image
  end

  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(params[:plant])
    if @plant.save
      redirect_to @plant, :notice => "Successfully created plant."
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @plant.update_attributes(params[:plant])
      redirect_to @plant, :notice  => "Successfully updated plant."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @plant.destroy
    redirect_to plants_url, :notice => "Successfully destroyed plant."
  end

  private
  def find_plant
    @plant = Plant.find(params[:id])
  end

  def search_array
    @plants = Plant.all
    @search_array = []
    @plants.each do |plant|
      @search_array << plant.common_name unless plant.common_name == nil
      @search_array << "#{plant.genus} #{plant.species}"
    end
  end

def first_wiki_image
    genus = @plant.genus ? @plant.genus : ""
    species = @plant.species ? @plant.species : ""
    common_name = @plant.common_name ? @plant.common_name : ""
    scientific_url = "http://en.wikipedia.org/w/api.php?format=json&action=query&titles=#{CGI.escape genus}%20#{CGI.escape species.downcase}&prop=imageinfo&iiprop=url&generator=images"
    common_url = "http://en.wikipedia.org/w/api.php?format=json&action=query&titles=#{CGI.escape common_name}&prop=imageinfo&iiprop=url&generator=images"
    @scientific_plant_images = scientific_url.to_uri.get.deserialise
    @common_plant_images = common_url.to_uri.get.deserialise

    # logger.ap "=========================================================================================="
    # logger.ap @scientific_plant_images
    # logger.ap @common_plant_images
    # logger.ap scientific_url
    # logger.ap common_url
    # logger.ap common_name
    # logger.ap "=========================================================================================="
    @wiki_plant_images = []
    if @scientific_plant_images.length > 0
      name = common_name.gsub(/\s+/, "").downcase.titleize
      # logger.ap name
      # logger.ap "----------------------------"
      @scientific_plant_images["query"]["pages"].each do |image|
        # logger.ap image[1]["imageinfo"][0]["url"]
        if image[1]["imageinfo"][0]["url"].include?(genus) && (image[1]["imageinfo"][0]["url"].include?(species.downcase) || image[1]["imageinfo"][0]["url"].include?(species.downcase)) || image[1]["imageinfo"][0]["url"].include?(name)
          @wiki_plant_images.push(image[1]["imageinfo"][0]["url"])
        end
      end
    end
    # logger.ap @common_plant_images.length
    if @common_plant_images.length > 0
      name = common_name.gsub(/\s+/, "")
      # logger.ap name
      # logger.ap "****************************"
      @common_plant_images["query"]["pages"].each do |image|
        # logger.ap image[1]["imageinfo"][0]["url"]
        if image[1]["imageinfo"][0]["url"].include?(genus) && (image[1]["imageinfo"][0]["url"].include?(species) || image[1]["imageinfo"][0]["url"].include?(species.downcase)) || image[1]["imageinfo"][0]["url"].include?(name)
          @wiki_plant_images.push(image[1]["imageinfo"][0]["url"])
        end
      end
    end

  end

end
