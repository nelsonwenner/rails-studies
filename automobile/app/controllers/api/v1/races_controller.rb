module Api
  module V1
    class RacesController < ApplicationController
      def create
        result = RacesManager::LoadCsv.call(race_params)

        if result && result.success?
          render status: 200, json: { message: "successfully" }
        else
          render status: 422, json: errors(result)
        end
      end

      private

      def race_params
        params.require(:race_file)
      end

      def errors(record)
        { errors: record.errors }
      end
    end
  end
end
