# typed: true

class CharactersJson
  def initialize(character:)
    @character = character
  end

  def to_h
    {
      id: @character.id.to_i,
      name: @character.name.to_s,
      description: @character.description.to_s,
      rarity: @character.rarity.to_i,
      region: @character.region.to_s
    }
  end
end
