class FacilityFactory
  ADDRESS_KEYS = {
    'CO' => %i[address_li address__1 city state zip],
    'NY' => %i[street_address_line_1 street_address_line_2 city state zip_code],
    'MO' => %i[address1 address2 city state zipcode]
  }.freeze

  NAME_KEYS = {
    'CO' => :dmv_office,
    'NY' => :office_name,
    'MO' => :name
  }.freeze

  PHONE_KEYS = {
    'CO' => :phone,
    'NY' => :public_phone_number,
    'MO' => :phone
  }.freeze

  def get_address(facility_info)
    keys = ADDRESS_KEYS[facility_info[:state]]
    return unless keys

    keys.map { |key| facility_info[key] }.compact.join(' ')
  end

  def get_name(facility_info)
    key = NAME_KEYS[facility_info[:state]]
    facility_info[key].to_s if key
  end

  def get_phone(facility_info)
    key = PHONE_KEYS[facility_info[:state]]
    facility_info[key].to_s if key
  end

  def create_factory(co_dmv_office_locations)
    co_dmv_office_locations.map do |facility_info|
      factory_details = {
        address: get_address(facility_info),
        name: get_name(facility_info),
        phone: get_phone(facility_info)
      }
      Facility.new(factory_details)
    end
  end
end
