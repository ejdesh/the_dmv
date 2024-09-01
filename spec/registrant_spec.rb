require 'spec_helper'
require 'Registrant'

RSpec.describe Registrant do
  before(:each) do
    @registrant_1 = Registrant.new('Bruce', 18, true)
    @registrant_2 = Registrant.new('Penny', 15)
    @registrant_3 = Registrant.new('Tucker', 15)
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@registrant_1).to be_an_instance_of(Registrant)
      expect(@registrant_1.name).to eq('Bruce')
      expect(@registrant_1.age).to eq(18)
      expect(@registrant_1.permit?).to eq(true)
      expect(@registrant_2.permit?).to eq(false)
      expect(@registrant_1.license_data).to eq({ written: false, license: false, renewed: false })
      expect(@registrant_1.license_data[:written]).to eq(false)
      expect(@registrant_1.license_data[:license]).to eq(false)
      expect(@registrant_1.license_data[:renewed]).to eq(false)
    end

    it 'can earn permit' do
      expect(@registrant_2.permit?).to eq(false)
      @registrant_2.earn_permit
      expect(@registrant_2.permit?).to eq(true)
    end
  end

  # 2 check permit?
  # 3 check earn_permit
  #
end
