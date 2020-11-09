require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe 'relationships' do
    it {should have_many :doctors}
  end

  describe 'instance methods' do
    before :each do
      @grey_sloan = Hospital.create!(name: "Grey Sloan Memorial")
      @seaside = Hospital.create!(name: "Seaside Health & Wellness")
      @meredith = @grey_sloan.doctors.create!(name: "Meredith Gray", specialty: "General Surgery", university: "Dartmouth College")
      @bailey = @grey_sloan.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stamford University")
      @george = @grey_sloan.doctors.create!(name: "George O'Malley", specialty: "General Surgery", university: "Stamford University")
      @callie = @seaside.doctors.create!(name: "Calliope Torres", specialty: "Orthopedic Surgery", university: "Purdue University")
    end
    it "#doctor_count" do
      expect(@grey_sloan.doctor_count).to eq(3)
      expect(@seaside.doctor_count).to eq(1)
    end

    it "#doctor_universities" do
      expected = ["Stamford University", "Dartmouth College"]
      expect(@grey_sloan.doctor_universities.sort).to eq(expected.sort)
      expect(@grey_sloan.doctor_universities.count).to eq(2)
    end
  end
end
