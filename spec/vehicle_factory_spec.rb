require 'spec_helper'
require 'vehicle_factory'

RSpec.describe VehicleFactory do
  before(:all) do
    @vehicles = VehicleFactory.new
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@vehicles).to be_a(VehicleFactory)
    end
  end
  describe '#create_vehicles' do
    it 'can return 1000 vehicles' do
      factory = @vehicles.create_vehicles
      expect(factory.first).to be_a(Vehicle)
    end
  end
end
