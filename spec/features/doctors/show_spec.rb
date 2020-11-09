require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit a doctors show page' do
    before :each do
      @grey_sloan = Hospital.create!(name: "Grey Sloan Memorial")
      @meredith = @grey_sloan.doctors.create!(name: "Meredith Gray", specialty: "General Surgery", university: "Dartmouth College")
      @bailey = @grey_sloan.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stamford University")
      @denny = @meredith.patients.create!(name: "Denny Duquette", age: 38)
      @katie = @meredith.patients.create!(name: "Katie Bryce", age: 24)
      @zola = @bailey.patients.create!(name: "Zola Shepherd", age: 4)
    end
    describe "I see all of that doctor's information" do
      it "I see the doctor's name, specialty, and university where they got their doctorate" do
        visit "/doctors/#{@meredith.id}"

        expect(page).to have_content(@meredith.name)
        expect(page).to have_content(@meredith.specialty)
        expect(page).to have_content(@meredith.university)

        expect(page).to_not have_content(@bailey.name)
      end

      it "I see the name of the hospital this doctor works for" do
        visit "/doctors/#{@meredith.id}"

        expect(page).to have_content(@grey_sloan.name)
      end

      it "I see a list of all the patients this doctor has" do
        visit "/doctors/#{@meredith.id}"

        expect(page).to have_content(@denny.name)
        expect(page).to have_content(@katie.name)

        expect(page).to_not have_content(@zola.name)
      end
    end
    describe "Next to each patient's name" do
      it "I see a button to remove them from that doctor's caseload" do
        visit "/doctors/#{@meredith.id}"

        within "#patient-#{@denny.id}" do
          expect(page).to have_button("Remove Patient")
        end

        within "#patient-#{@katie.id}" do
          expect(page).to have_button("Remove Patient")
        end
      end

      it "When I click button to remove patient, I am brought back to that doctor's show page and no longer see patient's name" do
        visit "/doctors/#{@meredith.id}"
        expect(page).to have_content(@denny.name)
        expect(page).to have_content(@katie.name)

        within "#patient-#{@katie.id}" do
          click_button("Remove Patient")
        end

        expect(current_path).to eq("/doctors/#{@meredith.id}")
        expect(page).to have_content(@denny.name)
        expect(page).to_not have_content(@katie.name)
      end
    end
  end
end
