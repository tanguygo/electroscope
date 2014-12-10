class StatementsController < ApplicationController
    before_action :set_statement, only: [:show, :edit, :update]
    before_action :set_box_session, only: [:create_from_box]

    skip_before_action :verify_authenticity_token, only: :create_from_box

      def index
        @statements=Statement.all
      end

      def create_from_box
        @statement = Statement.new(statement_params)
        @statement.box_session=@box_session
        @statement.save
        redirect_to statements_path
      end

      private

      def set_statement
        @statement = Statement.find(params[:id])
      end

      def statement_params
        params.permit(:pulse,:power,:time_of_measure)
      end

      def set_box_session
        @box_session = Box.find_by_token(params[:token]).box_sessions.last
      end
end
