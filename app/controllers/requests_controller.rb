class RequestsController < ApplicationController
  include Authenticable

  before_filter :set_software, except: [:index]
  append_before_action :set_request, only: [:destroy, :approve]

  # GET /requests
  # GET /requests.json
  def index
    if can?(:view_all)
      @requests = Request.all
    else
      @requests = Request.where(user_id: current_user.id)
    end
  end

  # GET /requests/new
  def new
    @request = @software.requests.build
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = @software.requests.new(request_params)
    @request.user = self.current_user

    respond_to do |format|
      if @request.save
        format.html { redirect_to softwares_path, notice: 'Request was successfully created.' }
        format.json { render action: 'show', status: :created, location: @request }
      else
        format.html { render action: 'new' }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url }
      format.json { head :no_content }
    end
  end

  def approve
    license = @software.licenses.select{|lic| lic.available? }.first
    allocation = Allocation.build @request, license
    respond_to do |format|
      if allocation.save
        @request.destroy
        format.html { redirect_to requests_path, notice: 'License successfully allocated' }
        #format.json { render action: 'show', status: :created, location: @request }
      else
        format.html { redirect_to requests_path, alert: 'Failed to allocate license' }
        #format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = @software.requests.find(params[:id])
    end

    def set_software
      @software = Software.find(params[:software_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:project_code)
    end
end
