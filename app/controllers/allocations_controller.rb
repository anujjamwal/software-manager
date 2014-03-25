class AllocationsController < ApplicationController
  include Authenticable

  before_action :set_license
  before_action :set_allocation, only: [:show, :edit, :update, :destroy]

  # GET /allocations
  # GET /allocations.json
  def index
    @allocations = @license.allocations.all
  end

  # GET /allocations/1
  # GET /allocations/1.json
  def show
  end

  # GET /allocations/new
  def new
    @allocation = @license.allocations.build
  end

  # GET /allocations/1/edit
  def edit
  end

  # POST /allocations
  # POST /allocations.json
  def create
    @allocation = @license.allocations.new(allocation_params)

    respond_to do |format|
      if @allocation.save
        format.html { redirect_to license_allocation_path(@license, @allocation), notice: 'Allocation was successfully created.' }
        format.json { render action: 'show', status: :created, location: @allocation }
      else
        format.html { render action: 'new' }
        format.json { render json: @allocation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /allocations/1
  # PATCH/PUT /allocations/1.json
  def update
    respond_to do |format|
      if @allocation.update(allocation_params)
        format.html { redirect_to license_allocation_path(@license, @allocation), notice: 'Allocation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @allocation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /allocations/1
  # DELETE /allocations/1.json
  def destroy
    @allocation.destroy
    respond_to do |format|
      format.html { redirect_to license_allocations_url(@license) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_allocation
      @allocation = @license.allocations.find(params[:id])
    end

 # Use callbacks to share common setup or constraints between actions.
    def set_license
      @license = License.find(params[:license_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def allocation_params
      params.require(:allocation).permit(:license_id, :user_id, :project_code)
    end
end
