require 'pry'

class FacilityFactory
  def get_address(facility_info)
    [facility_info[:address_li],
     facility_info[:address__1],
     facility_info[:city],
     facility_info[:state],
     facility_info[:zip]].compact.join(' ')
  end

  def get_name(facility_info)
    [facility_info[:dmv_office]].compact.join
  end

  def get_phone(facility_info)
    [facility_info[:phone]].compact.join
  end

  def create_factory(co_dmv_office_locations)
    # DmvDataService.new.co_dmv_office_locations
    factory = []

    co_dmv_office_locations.each do |facility_info|
      factory_details = { name: get_name(facility_info),
                          address: get_address(facility_info),
                          phone: get_phone(facility_info) }
      # services: f[:services_p]
      # binding.pry

      factory << Facility.new(factory_details)
    end

    factory
  end
end
