require_relative 'bike'

class DockingStation
attr_reader :bike
  def initialize
    @bike =[]
  end 

  def release_bike
    fail 'No bikes available' if @bike.empty?
    return @bike
  end
  
  def dock(bike)
    fail 'Docking station full' if @bike.length >= 20
    @bike << bike
  end

end