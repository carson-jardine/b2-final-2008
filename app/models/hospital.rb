class Hospital < ApplicationRecord
  has_many :doctors

  def doctor_count
    doctors.count
  end

  def doctor_universities
    doctors.distinct.pluck(:university)
  end
end
