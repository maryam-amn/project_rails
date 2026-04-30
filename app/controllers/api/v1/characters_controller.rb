class Api::V1::CharactersController < ApplicationController
      api :GET, "/characters", "list of all characters"
      api_version "v1"
      returns code: 200
      def index
        characters_json = Character.all.map { |character| CharacterJson.new(character:).to_h }
        render json: { characters: characters_json }
      end
end
