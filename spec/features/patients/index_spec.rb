require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit the patients index page' do
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

    it "I see the names of all patients listed from oldest to youngest" do
      visit "/patients"

      expect("#{@charlie.name}").to appear_before("#{@denny.name}")

      within '#all-patients' do
        expect(page.all('li')[0]).to have_content("#{@charlie.name}")
        expect(page.all('li')[1]).to have_content("#{@denny.name}")
        expect(page.all('li')[2]).to have_content("#{@katie.name}")
        expect(page.all('li')[3]).to have_content("#{@zola.name}")
      end
    end
  end
end
