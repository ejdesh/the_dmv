require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:all) do
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@factory).to be_a(VehicleFactory)
    end
  end

  describe '#create_vehicles' do
    it 'can return vehicles' do
      vehicles = @factory.create_vehicles(@wa_ev_registrations)
      expect(vehicles.first).to be_a(Vehicle)
      expect(vehicles.last).to be_a(Vehicle)
    end
  end
end
