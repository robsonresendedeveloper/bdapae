json.extract! patient, :id, :name, :sex, :born, :mother_name, :father_name, :entry_date, :exit_date, :infos, :created_at, :updated_at
json.url patient_url(patient, format: :json)
