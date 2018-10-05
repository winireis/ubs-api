class Clinic < ApplicationRecord
  #Geokit
  acts_as_mappable :default_units => :kms,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :latitude,
                   :lng_column_name => :longitude
  #Validations
  validates_presence_of :name, :address, :city, :phone, :latitude, :longitude,
                        :size, :adaptation_for_seniors, :medical_equipment,
                        :medicine
end
