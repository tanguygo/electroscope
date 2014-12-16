class StatementsController < ApplicationController
  before_action :set_statement, only: [:show, :edit, :update]
  before_action :set_box_session, only: [:create_from_box]
  skip_before_action :verify_authenticity_token, only: :create_from_box
  after_action :verify_policy_scoped, :only => :index

  def index
    @statements=policy_scope(Statement).order(created_at: :desc)
    authorize @statements
    @points={"cols"=>[
    {"id"=>"Date","label"=>"Date","type"=>"datetime"},
    {"id"=>"Power","label"=>"Puissance","type"=>"number"}],
    "rows"=>[]}
    @statements.each{|s|
      row=[{'v'=>"#{s.time_of_measure.to_f+8*3600}"},{'v'=> "#{s.power}"}]
      @points["rows"]<<{"c"=>row}
    }
  end

  def create_from_box
    if @box_session.statements.count<=1 || @box_session.plateau?(statement_params[:power]) == false
      @box_session.update(connected:true) if @box_session.statements.count==0
      add_a_point
    else # If power has not changed, we update the time of the last point
      @box_session.statements.last.update(time_of_measure: statement_params[:time_of_measure])
    end
    redirect_to statements_path
  end

  private

  def add_a_point
    @statement = Statement.new(statement_params)
    @statement.box_session=@box_session
    @statement.save
  end

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
