class PatientsController < ApplicationController
  respond_to :json

  def index
    respond_with Patient.all
  end

  def show
    respond_with Patient.find(params[:id])
  end

  def create
    respond_with Patient.create(post_params)
  end

  def update
    respond_with Patient.update(params[:id], post_params)
  end

  def destroy
    respond_with Patient.destroy(params[:id])
  end

  private
  def post_params
    params.require(:patient).permit(:first_name, :last_name, :bed_number)
  end
end
