# typed: false

class  Api::V1::CharactersController < ActionController::Base
  def index
    render json: { characters: characters_json }
  end
  def characters_json = Character.all.map { |character| CharactersJson.new(character:).to_h }
end
