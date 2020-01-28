require_relative 'room'

class RoomRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @rooms = []
    @next_id = 1
    load_csv
  end

  # read all
  def all
    @rooms
  end

  # read one
  def find(id)
    @rooms.find { |room| room.id == id }
  end

  # create
  def add_room(room)
    @rooms << room
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:capacity] = row[:capacity].to_i

      @rooms << Room.new(row)
    end
    @next_id = @rooms.any? ? @rooms.last.id + 1 : 1
  end
end
