require 'spec_helper'
require './lib/Registrant'
require 'pry'

RSpec.describe Facility do
  before(:each) do
    @facility_1 = Facility.new({  name: 'DMV Tremont Branch',
                                  address: '2855 Tremont Place Suite 118 Denver CO 80205',
                                  phone: '(720) 865-4600' })
    @facility_2 = Facility.new({  name: 'DMV Northeast Branch',
                                  address: '4685 Peoria Street Suite 101 Denver CO 80239',
                                  phone: '(720) 865-4600' })

    @registrant_1 = Registrant.new('Bruce', 18, true)
    @registrant_2 = Registrant.new('Penny', 16)
    @registrant_3 = Registrant.new('Tucker', 15)

    @bolt = Vehicle.new({ vin: '987654321abcdefgh',
                          year: 2019,
                          make: 'Chevrolet',
                          model: 'Bolt',
                          engine: :ev })

    @cruz = Vehicle.new({   vin: '123456789abcdefgh',
                            year: 2012,
                            make: 'Chevrolet',
                            model: 'Cruz',
                            engine: :ice })

    camaro = Vehicle.new({  vin: '1a2b3c4d5e6f',
                            year: 1969,
                            make: 'Chevrolet',
                            model: 'Camaro',
                            engine: :ice })
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@facility_1).to be_an_instance_of(Facility)
      expect(@facility_1.name).to eq('DMV Tremont Branch')
      expect(@facility_1.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility_1.phone).to eq('(720) 865-4600')
      expect(@facility_1.services).to eq([])
    end
  end

  describe '#add_service' do
    it 'can add available services' do
      expect(@facility_1.services).to eq([])
      @facility_1.add_service('Written Test')
      expect(@facility_1.services).to eq(['Written Test'])
    end

    it 'can add available services' do
      @facility_1.add_service('New Drivers License')
      @facility_1.add_service('Renew Drivers License')
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  describe '#register' do
    it 'does not have any vehicles registered' do
      expect(@facility_1.registered_vehicles).to eq([])
    end

    it 'returns an array of vehicles' do
      vehicles = @facility_1.register(@bolt)
      expect(vehicles[0]).to eq(@bolt)
    end
    it 'can register regular' do
      # TODO
    end

    it 'can register ev' do
    end

    it 'can register antique' do
    end
  end

  describe '#administer_written_test' do
    it 'can pass written test' do
      @facility_1.add_service('Written Test')
      result = @facility_1.administer_written_test(@registrant_1)
      expect(result).to eq(true)
    end

    it 'only tests permit holders who are >= 16' do
      @facility_1.add_service('Written Test')
      @facility_1.administer_written_test(@registrant_1)
      @facility_1.administer_written_test(@registrant_3)
      expect(@registrant_1.written?).to eq(true)
      expect(@registrant_3.written?).to eq(false)
    end
  end

  describe '#administer_road_test' do
    it 'only if written test was passed' do
      @facility_1.add_service('Written Test')
      @facility_1.add_service('Road Test')
      @facility_1.administer_written_test(@registrant_1)
      result = @facility_1.administer_road_test(@registrant_1)
      expect(result).to eq(true)

      # @facility_1.administer_written_test(@registrant_3)
      # expect(@registrant_1.written?).to eq(true)
      # expect(@registrant_3.written?).to eq(false)
    end
  end

  describe '#renew_license' do
    it 'renews license' do
    end
  end
end
