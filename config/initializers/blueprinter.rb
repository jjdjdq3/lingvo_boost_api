Blueprinter.configure do |config|
  config.generator = Oj if defined?(Oj)
  config.sort_fields_by = :definition
end