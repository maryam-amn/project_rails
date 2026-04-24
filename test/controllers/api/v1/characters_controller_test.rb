# frozen_string_literal: true

require "test_helper"

class  Api::V1::CharactersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "Should get index of all characters in json" do
    get v1_characters_url
    assert_response :success
    assert_match(/json/, response.header["Content-Type"])

    character = characters(:yanfei_from_fontaine_region)

    assert_includes response.body, character.name
  end
end
