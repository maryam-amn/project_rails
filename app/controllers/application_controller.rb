class ApplicationController < ActionController::Base
  #  We use it to be able to use activeadmin, this file can not be deleted
  #  remove security against CSFR attack for all requests in JSON format
  protect_from_forgery unless: -> { request.format.json? }
end
