class Patient
  attr_accessor :room, :id

  def initialize(attributes = {})
    @id = attributes[:id] # integer
    @name = attributes[:name] # string
    @cured = attributes[:cured] || false # boolean
    @room = attributes[:room] # instance
  end
end

# william =  Patient.new
# p william
# william.name = "william"
# p william
