Rails.application.configure do
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
  config.assets.js_compressor = :uglifier
  config.assets.compile = true
  config.serve_static_assets = true
  config.assets.digest = true
  config.log_level = :debug
  config.log_tags = [ :request_id ]
  config.action_mailer.perform_caching = false
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.log_formatter = ::Logger::Formatter.new
  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger = ActiveSupport::TaggedLogging.new(logger)
  end
  config.active_record.dump_schema_after_migration = false
  # Setup the mailer config
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_deliveries = true
  config.action_mailer.smtp_settings = {
    port: ENV['MAILGUN_SMTP_PORT'],
    address: ENV['MAILGUN_SMTP_SERVER'],
    user_name: ENV['MAILGUN_SMTP_LOGIN'],
    password: ENV['MAILGUN_SMTP_PASSWORD'],
    domain: 'cjb-overtime.herokuapp.com',
    authentication: :plain,
  }
end
