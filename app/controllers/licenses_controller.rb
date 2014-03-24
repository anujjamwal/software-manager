class LicensesController < ApplicationController
  before_action :set_software
  before_action :set_license, only: [:show, :edit, :update, :destroy]

  # GET /licenses
  # GET /licenses.json
  def index
    @licenses = @software.licenses.all
  end

  # GET /licenses/1
  # GET /licenses/1.json
  def show
  end

  # GET /licenses/new
  def new
    @license = @software.licenses.build
  end

  # GET /licenses/1/edit
  def edit
  end

  # POST /licenses
  # POST /licenses.json
  def create
    @license = @software.licenses.new(license_params)

    respond_to do |format|
      if @license.save
        format.html { redirect_to software_license_path(@software, @license), notice: 'License was successfully created.' }
        format.json { render action: 'show', status: :created, location: @license }
      else
        format.html { render action: 'new' }
        format.json { render json: @license.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /licenses/1
  # PATCH/PUT /licenses/1.json
  def update
    respond_to do |format|
      if @license.update(license_params)
        format.html { redirect_to software_license_path(@software, @license), notice: 'License was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @license.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /licenses/1
  # DELETE /licenses/1.json
  def destroy
    @license.destroy
    respond_to do |format|
      format.html { redirect_to software_licenses_url(@software) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_license
      @license = @software.licenses.find(params[:id])
    end

    def set_software
      @software = Software.find(params[:software_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def license_params
      params.require(:license).permit(:software_id, :license_user, :license, :user_count, :purchase_date, :cost)
    end
end
