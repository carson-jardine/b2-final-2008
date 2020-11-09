require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe 'relationships' do
    it {should have_many :doctor_patients}
    it {should have_many(:doctors).through(:doctor_patients)}
  end

  describe 'class methods' do
    before :each do
      @grey_sloan = Hospital.create!(name: "Grey Sloan Memorial")
      @seaside = Hospital.create!(name: "Seaside Health & Wellness")
      @meredith = @grey_sloan.doctors.create!(name: "Meredith Gray", specialty: "General Surgery", university: "Dartmouth College")
      @bailey = @grey_sloan.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stamford University")
      @callie = @seaside.doctors.create!(name: "Calliope Torres", specialty: "Orthopedic Surgery", university: "Purdue University")

      @denny = @meredith.patients.create!(name: "Denny Duquette", age: 38)
      @katie = @meredith.patients.create!(name: "Katie Bryce", age: 24)
      @zola = @bailey.patients.create!(name: "Zola Shepherd", age: 4)
      @charlie = @callie.patients.create!(name: "Charlie Hoynoski", age: 103)
    end
    it ".order_by_age" do
      expected = [@charlie, @denny, @katie, @zola]
      not_expected = [@zola, @katie, @denny, @charlie]
      expect(Patient.order_by_age).to eq(expected)
      expect(Patient.order_by_age).to_not eq(not_expected)
    end
  end
end
