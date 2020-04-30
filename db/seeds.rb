# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all
City.destroy_all
Specialty.destroy_all
DoctorToSpecialtyLink.destroy_all

["Generalist", "Dentist", "Dermatologist", "Pediatrist", "Radiologist"].each do |specialty|
	Specialty.create(name: specialty)
end

100.times do
	city = City.create(name: Faker::Address.city)
	doctor = Doctor.create(city_id: City.ids.sample, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, zip_code: Faker::Address.zip_code)
	patient = Patient.create(city_id: City.ids.sample, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
	appointment = Appointment.create(city_id: City.ids.sample, doctor_id: Doctor.ids.sample, patient: Patient.all.sample, date: Faker::Date.between(from: 2.days.ago, to: Date.today))
	DoctorToSpecialtyLink.create(doctor_id: Doctor.ids.sample, specialty_id: Specialty.ids.sample)
end

