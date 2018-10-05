require 'csv'

score = {
	"Desempenho mediano ou  um pouco abaixo da média" => 1,
	"Desempenho acima da média" => 2,
	"Desempenho muito acima da média" => 3
}

CSV.foreach(File.join(Rails.root, "db", "ubs.csv"), :headers => true, :encoding => 'UTF-8') do |row|
	name = row['nom_estab'].to_s
	address = row['dsc_endereco'].to_s
	city = row['dsc_cidade'].to_s
	phone = row['dsc_telefone'].to_s
	latitude = row['vlr_latitude'].to_f
	longitude = row['vlr_longitude'].to_f
	size = score[row['dsc_estrut_fisic_ambiencia'].to_s]
	adaptation_for_seniors = score[row['dsc_adap_defic_fisic_idosos'].to_s]
	medical_equipment = score[row['dsc_equipamentos'].to_s]
	medicine = score[row['dsc_medicamentos'].to_s]
	Clinic.create!(
		name: name,
		address: address,
		city: city,
		phone: phone,
		latitude: latitude,
		longitude: longitude,
		size: size,
		adaptation_for_seniors: adaptation_for_seniors,
		medical_equipment: medical_equipment,
		medicine: medicine
	)
  counter += 1
end
