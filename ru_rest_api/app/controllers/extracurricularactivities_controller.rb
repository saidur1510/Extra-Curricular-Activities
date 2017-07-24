class ExtracurricularactivitiesController < ApplicationController
  before_action :set_extracurricularactivity, only: [:show, :update, :destroy]

  # GET /extracurricularactivities
  def index
    @extracurricularactivities = Extracurricularactivity.all
    json_response(@extracurricularactivities)
  end

  # POST /extracurricularactivities
  def create
    @extracurricularactivity = Extracurricularactivity.create!(extracurricularactivity_params)
    json_response(@extracurricularactivity, :created)
  end

  # GET /extracurricularactivities/:id
  def show
    json_response(@extracurricularactivity)
  end

  # PUT /extracurricularactivities/:id
  def update
    @extracurricularactivity.update(extracurricularactivity_params)
    head :no_content
  end

  # DELETE /extracurricularactivities/:id
  def destroy
    @extracurricularactivity.destroy
    head :no_content
  end

  private

  def extracurricularactivity_params
    # whitelist params
    params.permit(:name, :department, :interest)
  end

  def set_extracurricularactivity
    @extracurricularactivity = Extracurricularactivity.find(params[:id])
  end
end