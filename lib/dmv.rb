class Dmv
  attr_reader :facilities

  def initialize
    @facilities = []
  end

  def add_facility(facility)
    @facilities << facility
  end

  def facilities_offering_service(service)
    yes = []

    @facilities.each do |facility|
      yes << facility if facility.services.include?(service)
    end
    yes.uniq
  end
end
