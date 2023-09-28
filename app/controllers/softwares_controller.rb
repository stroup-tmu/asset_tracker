class SoftwaresController < ApplicationController
  before_action :set_software, only: %i[ show edit update destroy ]

  # GET /softwares
  def index
    @softwares = Software.all
  end

  # GET /softwares/1
  def show
  end

  # GET /softwares/new
  def new
    @software = Software.new
  end

  # GET /softwares/1/edit
  def edit
  end

  # POST /softwares
  def create
    @software = Software.new(software_params)

    if @software.save
      redirect_to @software, notice: "Software was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /softwares/1
  def update
    if @software.update(software_params)
      redirect_to @software, notice: "Software was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /softwares/1
  def destroy
    @software.destroy
    redirect_to softwares_url, notice: "Software was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_software
      @software = Software.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def software_params
      params.require(:software).permit(:name, :license_count, :employee_ids => [])
    end
end
