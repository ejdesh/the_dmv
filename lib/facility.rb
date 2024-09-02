class Facility
  attr_reader   :name,
                :address,
                :phone,
                :services,
                :registered_vehicles,
                :collected_fees

  def initialize(facility)
    @name = facility[:name]
    @address = facility[:address]
    @phone = facility[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
    @services = @services.uniq
  end

  def vehicle_type(vehicle)
    return :ev if vehicle.electric_vehicle?
    return :antique if vehicle.antique?

    :regular
  end

  def collect_fee(vehicle)
    fee_schedule = { ev: 200, antique: 25, regular: 100 }
    fee_due = fee_schedule[vehicle_type(vehicle)]

    @collected_fees += fee_due
  end

  def register(vehicle)
    collect_fee(vehicle)
    @registered_vehicles << vehicle

    vehicle
  end

  def administer_written_test(registrant)
    return false unless @services.include?('Written Test')
    return false unless registrant.age >= 16 && registrant.permit?

    registrant.pass_written
  end

  def administer_road_test(registrant)
    return false unless @services.include?('Road Test') && registrant.written?

    registrant.earn_license
  end

  def renew_license(registrant)
    return false unless @services.include?('Renew Drivers License')

    registrant.renew_license if registrant.license?
  end
end
