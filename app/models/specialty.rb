class Specialty < ApplicationRecord
	has_many :doctor_to_specialty_links
	has_many :doctors, through: :doctor_to_specialty_links
end
