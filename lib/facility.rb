class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(facility)
    @name = facility[:name]
    @address = facility[:address]
    @phone = facility[:phone]
    @services = []
  end

  def add_service(service)
    @services << service
  end

  def register
    # ev? plate_type: ev $200
    # antique? plate_tpe: antique $25
    # register vehicle plate_tpe: regular $100
  end

  def take_written_test
    # A written test can only be administered to registrants with a permit and who are at least 16 years of age
  end

  def take_road_test
    # A road test can only be administered to registrants who have passed the written test
    # For simplicity’s sake, Registrants who qualify for the road test automatically earn a license
  end

  def renew_license
    # A license can only be renewed if the registrant has already passed the road test and earned a license
  end
end
