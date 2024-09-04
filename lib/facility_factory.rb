class FacilityFactory
  def create_factories(co_dmv_office_locations)
    # DmvDataService.new.co_dmv_office_locations
    factory = []

    # @name = f[:dmv_office]
    # @address = facility[:address]
    # @phone = facility[:phone]
    # @services = []
    # @registered_vehicles = []
    # @collected_fees = 0

    co_dmv_office_locations.each do |f|
      vehicle_details = { vin: f[:dmv_office] }
      puts f[:vin]

      # factory << Vehicle.new(vehicle_details)
    end

    # factory
  end
end
