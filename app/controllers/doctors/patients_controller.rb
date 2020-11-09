class Doctors::PatientsController < DoctorsController
  def destroy
    @doctor = Doctor.find(params[:id])
    patient = @doctor.patients.find(params[:patient_id])
    patient.destroy(params[:patient_id])
    redirect_to "/doctors/#{@doctor.id}"
  end
end
