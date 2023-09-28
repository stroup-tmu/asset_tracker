class AssetsController < ApplicationController
  before_action :set_asset, only: %i[ show edit update destroy ]

  # GET /assets
  def index
    @assets = Asset.all
  end

  # GET /assets/1
  def show
  end

  # GET /assets/new
  def new
    @asset = Asset.new
  end

  # GET /assets/1/edit
  def edit
  end

  # POST /assets
  def create
    @asset = Asset.new(asset_params)

    if @asset.save
      redirect_to @asset, notice: "Asset was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /assets/1
  def update
    if @asset.update(asset_params)
      redirect_to @asset, notice: "Asset was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /assets/1
  def destroy
    @asset.destroy
    redirect_to assets_url, notice: "Asset was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asset
      @asset = Asset.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def asset_params
      params.require(:asset).permit(:name, :asset_type_id, :manufacturer_id)
    end
end
