class PatientsController < ApplicationController
  def index
    @patients = Patient.order(age: :desc)
  end
end
