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

      def index
        render status: 200, json: races, each_serializer: RaceSerializer
      end

      private

      def races
        tournament = Tournament.where(
          year: params[:tournament_year]
        ).first! or not_found
        @races ||= Race.where(tournament_id: tournament.id)
      end

      def race_params
        params.require(:race_file)
      end

      def errors(record)
        { errors: record.errors }
      end
    end
  end
end
