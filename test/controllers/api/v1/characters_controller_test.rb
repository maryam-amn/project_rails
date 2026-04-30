# frozen_string_literal: true

require "test_helper"

class Api::V1::CharactersControllerTest < ActionDispatch::IntegrationTest
  test "Should get return success or code 200" do
    get api_v1_characters_url
    assert_response :success
    assert_equal 200, response.status
  end

  test "Should get all characters in json" do
    get api_v1_characters_url

    assert_response :success

    assert_match(/json/, response.header["Content-Type"])
    result_expected = Character.count

    assert_equal result_expected, response.parsed_body["characters"].count
  end
end
