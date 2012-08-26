class PlantsController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show, :search, :browse]
  before_filter :require_admin, :only => :destroy
  before_filter :require_editor, :except => [:index, :show, :search, :browse]
  before_filter :find_plant, :except => [:index, :search, :new, :create, :browse]
  before_filter :search_array
  respond_to :html, :json

  def index
    @plants = Plant.all
    respond_with(@plants)
  end

  def search
    @plants = Plant.search params[:search]
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

end
