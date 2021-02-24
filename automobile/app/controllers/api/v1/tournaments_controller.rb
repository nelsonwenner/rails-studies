module Api
  module V1
    class TournamentsController < ApplicationController
      before_action :set_tournament, only: [:show]

      def index
        render status: 200, json: tournaments, each_serializer: TournamentSerializer
      end

      def show
        render status: 200, json: @tournament, serializer: TournamentSerializer
      end

      private

      def tournaments
        @tournaments ||= Tournament.all
      end

      def set_tournament
        @tournament = Tournament.where(year: params[:year]).first! or not_found
      end
    end
  end
end
