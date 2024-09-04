require 'spec_helper'

RSpec.describe FacilityFactory do
  before(:all) do
    @factory = FacilityFactory.new
    # @dmv_office_locations = DmvDataService.new.co_dmv_office_locations
    @dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
    @facility_info = { address_li: '123 3rd St',
                       address__1: 'Suite 110',
                       city: 'San Jo',
                       state: 'CO',
                       dmv_office: 'Always Busy North',
                       phone: '867-5309',
                       zip: '93402' }
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@factory).to be_a(FacilityFactory)
    end
  end

  describe '#create_factory' do
    it 'can return facilities' do
      facilities = @factory.create_factory(@dmv_office_locations)
      expect(facilities.first).to be_a(Facility)
      expect(facilities.last).to be_a(Facility)
    end
  end

  describe '#get_address' do
    it 'can return an address' do
      address = '123 3rd St Suite 110 San Jo CO 93402'
      expect(@factory.get_address(@facility_info)).to eq(address)
    end
  end

  describe '#get_name' do
    it 'can return a name' do
      name = 'Always Busy North'
      expect(@factory.get_name(@facility_info)).to eq(name)
    end
  end

  describe '#get_phone' do
    it 'can return a phone' do
      phone = '867-5309'
      expect(@factory.get_phone(@facility_info)).to eq(phone)
    end
  end
end
