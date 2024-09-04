require 'pry'

class FacilityFactory
  def determine_source(facility_info)
    if facility_info[:state] == 'CO'
      state = 'CO'
    elsif facility_info[:state] == 'MO'
      state = 'MO'
    elsif facility_info[:state] == 'NY'
      state = 'NY'
      # elsif facility_info[:state] == 'Cali'
      # state = 'Cali' # for testing only
    end
  end

  def get_address(facility_info)
    source = determine_source(facility_info)
    return unless %w[CO NY MO].find { |state| state == source }

    if source == 'CO'
      [facility_info[:address_li],
       facility_info[:address__1],
       facility_info[:city],
       facility_info[:state],
       facility_info[:zip]].compact.join(' ')
    elsif source == 'NY'
      [facility_info[:street_address_line_1],
       facility_info[:street_address_line_2],
       facility_info[:city],
       facility_info[:state],
       facility_info[:zip_code]].compact.join(' ')
    elsif source == 'MO'
      [facility_info[:address1],
       facility_info[:address2],
       facility_info[:city],
       facility_info[:state],
       facility_info[:zipcode]].compact.join(' ')
    end
  end

  def get_name(facility_info)
    source = determine_source(facility_info)
    return unless %w[CO NY MO].find { |state| state == source }

    # :office_name

    if source == 'CO'
      [facility_info[:dmv_office]].compact.join
    elsif source == 'NY'
      [facility_info[:office_name]].compact.join
    elsif source == 'MO'
      [facility_info[:name]].compact.join
    end
  end

  def get_phone(facility_info)
    source = determine_source(facility_info)
    return unless %w[CO NY MO].find { |state| state == source }

    if source == 'CO'
      [facility_info[:phone]].compact.join
    elsif source == 'NY'
      [facility_info[:public_phone_number]].compact.join
    elsif source == 'MO'
      [facility_info[:phone]].compact.join
    end
  end

  #  def create_factory(source)
  #    co_create_factory(source)
  #  end
  #
  def create_factory(co_dmv_office_locations)
    # DmvDataService.new.co_dmv_office_locations
    factory = []

    co_dmv_office_locations.each do |facility_info|
      factory_details = { address: get_address(facility_info),
                          name: get_name(facility_info),
                          phone: get_phone(facility_info) }
      # services: f[:services_p]
      # binding.pry

      factory << Facility.new(factory_details)
    end

    factory
  end
end
