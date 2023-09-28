class AssetTypesController < ApplicationController
  before_action :set_asset_type, only: %i[ show edit update destroy ]

  # GET /asset_types
  def index
    @asset_types = AssetType.all
  end

  # GET /asset_types/1
  def show
  end

  # GET /asset_types/new
  def new
    @asset_type = AssetType.new
  end

  # GET /asset_types/1/edit
  def edit
  end

  # POST /asset_types
  def create
    @asset_type = AssetType.new(asset_type_params)

    if @asset_type.save
      redirect_to @asset_type, notice: "Asset type was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /asset_types/1
  def update
    if @asset_type.update(asset_type_params)
      redirect_to @asset_type, notice: "Asset type was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /asset_types/1
  def destroy
    @asset_type.destroy
    redirect_to asset_types_url, notice: "Asset type was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asset_type
      @asset_type = AssetType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def asset_type_params
      params.require(:asset_type).permit(:name)
    end
end
