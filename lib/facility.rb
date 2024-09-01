require 'pry'

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

  def register(vehicle)
    @registered_vehicles << vehicle
    # TODO
    # ev? plate_type: ev $200
    # antique? plate_tpe: antique $25
  end

  def administer_written_test(registrant)
    return false unless @services.include?('Written Test')
    return false unless registrant.age >= 16 && registrant.permit?

    # binding.pry if registrant.age == 15

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
