class BoxSession < ActiveRecord::Base
  belongs_to :flat
  belongs_to :box
  has_many :statements, dependent: :destroy
  has_many :sponsorships, through: :box

  after_create :check_if_sponsored

  def activate
    self.update(start_date:Time.now(),activated:true,connected:false)
    self.box.update(localization: "client")
  end

  def connect
    self.update(activated:true)
  end

  def treat_impulse(statement_params)
    if self.statements.size<=1 || self.plateau?(statement_params[:power]) == false
      self.connect if self.statements.size==0
      self.add_a_point(statement_params)
    else # If power has not changed, we update the time of the last point
      self.statements.last.update(time_of_measure: statement_params[:time_of_measure])
    end
  end

  def add_a_point(statement_params)
    self.statements.create(statement_params)
  end

  def compute_energy_counters
    statements = self.statements.last_week
    energy_counters=Hash.new
    energy_counters[:last_week] = compute_energy_from_statements({statements: statements})
    energy_counters_limits = {
      last_24h: [DateTime.now()-1.day,DateTime.now()],
      today: [DateTime.now.beginning_of_day(),DateTime.now.end_of_day()]
    }
    (0..6).to_a.each{|nb_days_behind|
      energy_counters_limits[nb_days_behind]=[start_wday(nb_days_behind),start_wday(nb_days_behind)+1.day]
    }

    energy_counters_limits.each{|period,limits|
      energy_counters[period] = compute_energy_from_statements({statements: statements,limits: limits})
    }
    return energy_counters
  end

  def user
    return self.flat.user
  end

  def plateau?(power)
    return false
    # return self.statements[-1].power.to_i==self.statements[-2].power.to_i && self.statements[-1].power.to_i==power.to_i
  end

  def check_if_sponsored
    if s = self.box.sponsorships.active.first
      s.update_attributes(status: 'complete', receiver: self.user)
    end
  end

  def send_activation_email
    UserMailer.activation(self).deliver
  end


  private

  def start_wday(nb_days_behind)
    (Date.today - nb_days_behind).midnight
  end

  def compute_energy_from_statements(attributes={})
    #si une impulsion correspond à 1kwh, il suffit de sommer les points pour connaître
    #l'énergie consommée. s'il y a des interruptions, il faut calculer une intégrale à partir
    #des points disponibles
    return attributes[:statements].size unless attributes.key?(:limits)
    return attributes[:statements].select{|statement| statement.time_of_measure >\
     attributes[:limits][0] && statement.time_of_measure <= attributes[:limits][1]}.size
  end
end
