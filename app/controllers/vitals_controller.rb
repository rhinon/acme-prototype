class VitalsController < ApplicationController
  respond_to :json

  def index
    respond_with Vital.all
  end

  def show
    respond_with Vital.find(params[:id])
  end

  def create
    respond_with Vital.create(post_params)
  end

  def update
    respond_with Vital.update(params[:id], post_params)
  end

  def destroy
    respond_with Vital.destroy(params[:id])
  end

  private
  def post_params
    params.require(:vital).permit(:patient_id, :blood_pressure_systolic, :blood_pressure_diastolic, :body_temp, :respiratory_rate_bpm, :heart_rate_bpm)
  end
end
