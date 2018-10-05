class ClinicSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :city, :phone, :geocode, :scores

  def geocode
    {latitude: object.latitude.to_f,
     longitude: object.longitude.to_f}
  end

  def scores
    {size: object.size.to_i,
     adaptation_for_seniors: object.adaptation_for_seniors.to_i,
     medical_equipment: object.medical_equipment.to_i,
     medicine: object.medicine.to_i}
  end
end
