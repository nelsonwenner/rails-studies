module Api
  module V1
    class ClassificationsController < ApplicationController
      before_action :set_race, only: [:index]

      def index
        result = ClassificationsManager::ClassificationExecuter.call(@race)

        if result && result.success?
          render status: 200, json: result.payload
        else
          render status: 422, json: errors(result)
        end
      end
    
      private

      def set_race
        @race = Race.where(
          date: "#{params[:tournament_year]}/#{params[:month]}/#{params[:day]}"
        ).first! or not_found
      end

      def errors(record)
        { errors: record.errors }
      end
    end
  end
end
