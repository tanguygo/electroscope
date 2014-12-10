class StatementsController < ApplicationController
    before_action :set_statement, only: [:show, :edit, :update]

      def new
        @statement = Statement.new
      end

      def create
        @statement = Statement.new(statement_params)
      end

      private

      def set_statement
        @statement = Statement.find(params[:id])
      end

      def statement_params
        params.require(:statement).permit(:pulse,:power,:user)
      end

      def set_box
        @box = BoxSession.find(params[:user_id])
      end
end
