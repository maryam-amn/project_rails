# frozen_string_literal: true

require "test_helper"

class Api::V1::CharactersControllerTest < ActionDispatch::IntegrationTest
  test "Should get all characters" do
    get api_v1_characters_url

    assert_response :success

    assert_match(/json/, response.header["Content-Type"])

    character = characters(:yanfei_from_fontaine_region)
    character_to_json = CharacterJson.new(character:).to_h

    assert_includes response.parsed_body["characters"], character_to_json.as_json

    result_expected = Character.count
    assert_equal result_expected, response.parsed_body["characters"].count
  end
end
