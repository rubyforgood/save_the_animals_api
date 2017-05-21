class EthogramsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ethogram, only: %i[show edit update destroy]

  # GET /ethograms
  def index
    @ethograms = Ethogram.all
  end

  # GET /ethograms/1
  def show; end

  # GET /ethograms/new
  def new
    @ethogram = Ethogram.new
  end

  # GET /ethograms/1/edit
  def edit; end

  # POST /ethograms
  def create
    @ethogram = Ethogram.new(ethogram_params)

    if @ethogram.save
      redirect_to @ethogram, notice: 'Ethogram was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /ethograms/1
  def update
    if @ethogram.update(ethogram_params)
      redirect_to @ethogram, notice: 'Ethogram was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /ethograms/1
  def destroy
    @ethogram.destroy
    redirect_to ethograms_url, notice: 'Ethogram was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ethogram
    @ethogram = Ethogram.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def ethogram_params
    params.require(:ethogram).permit(:name, :structure)
  end
end
