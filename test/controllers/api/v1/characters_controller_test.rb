# frozen_string_literal: true

require "test_helper"

class  Api::V1::CharactersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "Should get index of all characters in json" do
    get v1_characters_url
    assert_response :success
    assert_match(/json/, response.header["Content-Type"])

    character = characters(:yanfei_from_fontaine_region)

    expected_json =
      {
        id: 519887325,
        name: "Yanfei",
        description: "Yanfei est un personnage Pyro 4 étoiles de Genshin Impact qui utilise un catalyseur",
        rarity: 4,
        region: "Liyue"
      }

    character_to_json = CharactersJson.new(character:).to_h

     assert_equal expected_json, character_to_json
  end
end
