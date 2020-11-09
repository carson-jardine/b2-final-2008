require 'rails_helper'

describe 'As a visitor' do
  describe "When I visit a hospital's show page" do
    before :each do
      @grey_sloan = Hospital.create!(name: "Grey Sloan Memorial")
      @seaside = Hospital.create!(name: "Seaside Health & Wellness")
      @meredith = @grey_sloan.doctors.create!(name: "Meredith Gray", specialty: "General Surgery", university: "Dartmouth College")
      @bailey = @grey_sloan.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stamford University")
      @callie = @seaside.doctors.create!(name: "Calliope Torres", specialty: "Orthopedic Surgery", university: "Purdue University")
    end
    describe "I see that hospital's information" do
      it "I see that hospital's name with the number of doctors working there and the universities they attended" do

        visit "/hospitals/#{@grey_sloan.id}"

        expect(page).to have_content(@grey_sloan.name)

        expect(page).to_not have_content(@seaside.name)
      end

      it "I see the number of doctors working at the hospital" do
        visit "/hospitals/#{@grey_sloan.id}"

        expect(page).to have_content(@grey_sloan.doctor_count)

        expect(page).to_not have_content(@seaside.doctor_count)
      end

      it "I see a unique list of universities the hospital's doctors attended" do
        visit "/hospitals/#{@grey_sloan.id}"

        expect(page).to have_content(@grey_sloan.doctor_universities)

        expect(page).to_not have_content(@seaside.doctor_universities)
      end
    end
  end
end
