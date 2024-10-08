class Registrant
  attr_reader :name,
              :age,
              :license_data

  def initialize(name, age, permit = false)
    @name = name
    @age = age
    @permit = permit
    @license_data = { written: false,
                      license: false,
                      renewed: false }
  end

  def permit?
    @permit
  end

  def written?
    @license_data[:written]
  end

  def license?
    @license_data[:license]
  end

  def renewed?
    @license_data[:renewed]
  end

  def earn_license
    @license_data[:license] = true
  end

  def earn_permit
    @permit = true
  end

  def pass_written
    @license_data[:written] = true
  end

  def renew_license
    @license_data[:renewed] = true
  end
end
