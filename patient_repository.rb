require_relative 'patient'
require_relative 'room_repository'
require 'csv'

class PatientRepository
  def initialize(csv_file_path, room_repository)
    @csv_file_path = csv_file_path
    @room_repository = room_repository
    @patients = []
    # @id_for_next_created_patient = 1
    @next_id = 1
    load_csv
  end

  def all
    @patients
  end

  def add_patient(patient)
    patient.id = @next_id
    @patients << patient
    @next_id += 1
    # save_csv
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:room] = @room_repository.find(row[:room_id].to_i)
      row[:cured] = row[:cured] == 'true'

      # p row
      @patients << Patient.new(row)
    end
    @next_id = @patients.any? ? @patients.last.id + 1 : 1
  end
end


room_repo = RoomRepository.new('rooms.csv')
room_repo

patient_repo = PatientRepository.new('patients.csv', room_repo)
p patient_repo.all

# sho = Patient.new(name: 'sho')
# tj = Patient.new(name: 'tj')
# repo.add_patient(sho)
# repo.add_patient(tj)
# p repo.all
