class ApplicationController < ActionController::Base
  #  We use it to be able to use activeadmin, this file can not be deleted
  # enable security against CSFR attacks, all request (except GET) are verified with a secure token
  protect_from_forgery unless: -> { request.format.json? }
end
