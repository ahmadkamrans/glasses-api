# rubocop:disable Metrics/ClassLength
class Api < Grape::API
  include Pundit::Authorization

  prefix 'api'

  format :json

  # Rescue from syntax errors, etc, except when in the test environment
  unless Rails.env.test?
    rescue_from :all do |e|
      # Still need to be able to debug, lets log the error stack.
      Rails.logger.error e.message
      e.backtrace.each { |line| Rails.logger.error line }

      Rack::Response.new({ error_context: :application, error_code: :internal_server_error, error_message: e.message, error_fields: {} }.to_json, 500)
    end
  end

  rescue_from Grape::Exceptions::ValidationErrors do |e|
    Rack::Response.new({ error_context: :validation, error_code: :validation_errors, error_message: e.message, error_fields: {} }.to_json, 422)
  end

  rescue_from ActiveRecord::RecordInvalid do |e|
    Rack::Response.new({ error_context: :db, error_code: :validation_errors, error_message: e.message, error_fields: {} }.to_json, 422)
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    Rack::Response.new({ error_context: :db, error_code: :record_not_found, error_message: e.message, error_fields: {} }.to_json, 422)
  end

  helpers Pundit

  rescue_from Pundit::NotAuthorizedError do |e|

    message = e.message

    Rack::Response.new({ error_context: :policy, error_code: :authorization_error, error_message: message }.to_json, 422)
  end

  helpers do

    def declared_params
      declared(params, include_missing: false)
    end

    def authenticating_user?
      %r{/api/v[123]/authentications}.match? request.path
    end

    def authenticate_request!
      fail! :auth, 401, "Failed to authenticate", status_code: 401 unless current_api_consumer

      add_auth_header_to_response current_api_consumer
    end

    def add_auth_header_to_response(current_api_consumer)
      header 'X-Authentication', current_api_consumer.jwt
    end

    def current_api_consumer(allow_nil: false)
      @current_api_consumer ||= begin
        command = AuthorizeApiRequest.call(request.headers)

        fail! :auth, 'invalid_token', command.errors, {}, 403 unless allow_nil || command.success?
        command.result
      end
    end

    # Used by pundit
    def current_user
      @current_user ||= current_api_consumer(allow_nil: true)
    end

    def fail!(context, code, message = nil, error_fields = {}, status_code = 422)
      error_fields ||= {}
      message ||= I18n.t(code, scope: :api)
      Rails.logger.debug "context:#{context}, code:#{code}, message:#{message}, error_fields:#{error_fields}"
      failure_hash = { error_context: context, error_message: message, error_code: code.to_s, error_fields: error_fields }
      error! failure_hash, status_code
    end
  end

  mount V1::Root
end
# rubocop:enable Metrics/ClassLength
