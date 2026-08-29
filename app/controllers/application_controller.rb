class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity
  rescue_from ActionController::ParameterMissing, with: :bad_request

  rescue_from StandardError, with: :internal_server_error if Rails.env.production?

  private

  def record_not_found(exception)
    render json: { error: "Record not found", details: exception.message }, status: :not_found
  end

  def unprocessable_entity(exception)
    render json: { error: "Validation failed", details: exception.record.errors.full_messages }, status: :unprocessable_entity
  end

  def bad_request(exception)
    render json: { error: "Bad request", details: exception.message }, status: :bad_request
  end

  def internal_server_error(exception)
    render json: { error: "Internal server error", details: exception.message }, status: :internal_server_error
  end
end
