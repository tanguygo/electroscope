class StatementsController < ApplicationController
    before_action :set_statement, only: [:show, :edit, :update]
    before_action :set_box_session, only: [:create_from_box]

      def index

      end

      def create_from_box
        @statement = Statement.new(statement_params)
        @statement.box_session=@box_session
        @statement.save
      end

      private

      def set_statement
        @statement = Statement.find(params[:id])
      end

      def statement_params
        params.require(:statement).permit(:pulse,:power,:user,:time_of_measure)
      end

      def set_box_session
        @box_session = Box.find(params[:user]).box_sessions.last
      end
end
