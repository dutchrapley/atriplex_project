class PlantsController < ApplicationController
  
  before_filter :authenticate_user!, :except => [:index, :show]
  
  def index
    @plants = Plant.all
  end

  def show
    @plant = Plant.find(params[:id])
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
    @plant = Plant.find(params[:id])
  end

  def update
    @plant = Plant.find(params[:id])
    if @plant.update_attributes(params[:plant])
      redirect_to @plant, :notice  => "Successfully updated plant."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @plant = Plant.find(params[:id])
    @plant.destroy
    redirect_to plants_url, :notice => "Successfully destroyed plant."
  end
end
