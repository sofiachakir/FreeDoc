class CreateDoctorToSpecialtyLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :doctor_to_specialty_links do |t|
    	t.belongs_to :doctor, index: true
    	t.belongs_to :specialty, index: true
      t.timestamps
    end
  end
end
