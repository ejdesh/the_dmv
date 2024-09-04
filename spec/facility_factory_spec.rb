require 'spec_helper'

RSpec.describe FacilityFactory do
  before(:all) do
    @factory = FacilityFactory.new
    @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@factory).to be_a(FacilityFactory)
    end
  end

  describe '#create_facilities' do
    xit 'can return facilities' do
      facilities = @factory.create_facilities(@co_dmv_office_locations)
      expect(@factory.first).to be_a(Factory)
      expect(@factory.last).to be_a(Factory)
    end
  end
end
