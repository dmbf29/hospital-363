require_relative 'patient'
require 'csv'


file_path = 'patients.csv'
csv_options = { headers: :first_row, header_converters: :symbol }
CSV.foreach(file_path, csv_options) do |row|
  row[:id] = row[:id].to_i
  row[:cured] = row[:cured] == 'true'

  Patient.new(row)
end
