class DoctorsController < ApplicationController
  def show
    @doctor = Doctor.find(params[:id])
    @patients = @doctor.patients
  end

  # def destroy
  #   @doctor = Doctor.find(params[:id])
  #   # require "pry"; binding.pry
  #   patient = @doctor.patients.find(params[:patient_id])
  #   Patient.destroy(params[:patient_id])
  #   redirect_to "/doctors/#{@doctor.id}"
  # end

end
