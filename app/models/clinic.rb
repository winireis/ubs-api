class Clinic < ApplicationRecord
  #Geokit
  #Validations
  validates_presence_of :name, :address, :city, :phone, :latitude, :longitude,
                        :size, :adaptation_for_seniors, :medical_equipment,
                        :medicine
end
