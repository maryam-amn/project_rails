class Api::V1::CharactersController < ApplicationController
      api :GET, "/characters", "list of all characters"
      api_version "v1"
      returns code: 200
      def index
        characters_json = Character.all.map { |character| CharacterJson.new(character:).to_h }
        render json: { characters: characters_json }
      end

      api :GET, "/characters/:id", "render a character"
      api_version "v1"
      returns code: 200
      error :not_found, "character not found"

      def show
        begin
          character = Character.find(params[:id])
        rescue ActiveRecord::RecordNotFound
          render status: :not_found, json: { message: "Character not found" }
        else
          render json: CharacterJson.new(character:).to_h
        end
      end
end
