class Api::V1::BaseController < ApplicationController
  respond_to :json

  #rescue_from ActionController::ParameterMissing, with: :missing_parameter

  private
  def current_resource_owner
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end
end
