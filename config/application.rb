require_relative "boot"

require "rails/all"

# Windows環境でのタイムゾーンデータ読み込みエラーを解消する設定
require 'tzinfo'
begin
  # OS標準のデータソースを探し、なければGem(tzinfo-data)を強制的に読み込む
  TZInfo::DataSource.get
rescue TZInfo::DataSourceNotFound
  require 'tzinfo/data'
  TZInfo::DataSource.set(:ruby)
end

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Acto
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    config.autoload_lib(ignore: %w(assets tasks))

    # Configuration for the application, engines, and railties goes here.
    # config.time_zone = "Tokyo"
  end
end