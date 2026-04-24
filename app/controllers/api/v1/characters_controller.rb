# frozen_string_literal: true

class  Api::V1::CharactersController < ActionController::Base
  def index
    @characters = Character.all

    render json:  { characters:
       @characters.map do |character|
         {
           id: character.id.to_i,
           name: character.name.to_s,
           description: character.description.to_s,
           rarity: character.rarity.to_i,
           region: character.region.to_s
         }
       end
    }
  end
end
