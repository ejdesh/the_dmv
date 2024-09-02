class VehicleFactory
  def initialize
    @dmv_data = DmvDataService.new.wa_ev_registrations
    @factory = []
  end

  def create_vehicles
    @dmv_data.each do |v|
      vehicle_details = { vin: v[:vin_1_10],
                          year: v[:model_year].to_i,
                          make: v[:make],
                          model: v[:model],
                          engine: :ev }

      @factory << Vehicle.new(vehicle_details)
    end

    @factory
  end
end
