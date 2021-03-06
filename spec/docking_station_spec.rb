require 'docking_station'
require 'bike'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it { is_expected.to respond_to(:dock).with(1).argument }

  it 'releases working bikes' do 
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to eq [bike]
  end 


  describe '#dock' do
    it 'raises an error when the dock is full' do 
      20.times {subject.dock Bike.new}
      expect {subject.dock Bike.new}.to raise_error 'Docking station full'
    end 
  end 

  it 'docks something' do 
    bike = Bike.new
    #We want to return the bike we dock
    expect(subject.dock(bike)).to eq [bike]
  end

  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq [bike]
  end
  
  describe '#release_bike' do

    it 'releases a bike' do 
      bike = Bike.new
      subject.dock(bike)
      #We want to release the bike we docked.
      expect(subject.release_bike).to eq [bike]
    end

    it 'raises an error when no bikes are available' do 
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end      
end

#Arrange - all conditions needed for code to run
#Act - execute code
#Assert - The test had an effect or returned expected val