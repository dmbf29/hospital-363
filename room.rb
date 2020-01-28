require_relative 'patient'
class Room
  attr_accessor :id
  attr_reader :patients

  def initialize(attributes = {})
    @id = attributes[:id]
    @capacity = attributes[:capacity] || 0 # integer
    @patients = [] # array of instances
  end

  def full?
    @capacity == @patients.size
  end

  def add_patient(patient)
    raise Exception, "Room is full." if full?

    @patients << patient
    patient.room = self # instance of a room
  end
end

room = Room.new(capacity: 2)
ryanda = Patient.new(name: "Ryanda")
william = Patient.new(name: "william")
# hiro = Patient.new(name: "hiro")

room.add_patient(ryanda)
room.add_patient(william)
# room.add_patient(hiro)

# p ryanda.room.full?
# p william.room
# p room.patients





