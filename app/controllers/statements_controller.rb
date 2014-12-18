class StatementsController < ApplicationController
  before_action :set_statement, only: [:show, :edit, :update]
  before_action :set_box_session, only: [:create_from_box]
  skip_before_action :verify_authenticity_token, only: :create_from_box
  skip_before_action :authenticate_user!, only: [:create_from_box,:index]
  after_action :verify_policy_scoped, :only => :index
  layout "dashboard"

  def index
    @statements=policy_scope(Statement).order(created_at: :desc)
    @energy_counters = current_user.last_box_session.compute_energy_counters
    @points=live_chart_json(@statements)
    @days=hist_chart_json(@energy_counters)
  end

  def live_chart_json(statements)
    points={"cols"=>[
      {"id"=>"Date","label"=>"Date","type"=>"datetime"},
      {"id"=>"Power","label"=>"Puissance","type"=>"number"}],
      "rows"=>[]}
    statements.each{|s|
      row=[{'v'=>"#{s.time_of_measure.to_f+7*3600}"},{'v'=> "#{s.power}"}]
      points["rows"]<<{"c"=>row}
    }
    return points
  end

  def hist_chart_json(energy_counters)
    days={"cols"=>[
      {"id"=>"Day","label"=>"","type"=>"string"},
      {"id"=>"Power","label"=>"Energie","type"=>"number"}],
      "rows"=>[]}
    (0..6).to_a.reverse.each{|nb_days_behind|
      weekday = I18n.l((Date.today - nb_days_behind.days), format: :day)
      row=[{'v'=>weekday},{'v'=> "#{energy_counters[nb_days_behind]}"}]
      days["rows"]<<{"c"=>row}
    }
    return days
  end

  def create_from_box
    @box_session.treat_impulse(statement_params)
    redirect_to root_path
  end

  private

  def set_statement
    @statement = Statement.find(params[:id])
    authorize @statement
  end

  def statement_params
    params.permit(:pulse,:power,:time_of_measure)
  end

  def set_box_session
    @box_session = Box.find_by_token(params[:token]).box_sessions.last
  end
end
