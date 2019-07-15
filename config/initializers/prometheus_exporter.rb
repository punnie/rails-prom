# frozen_string_literal: true

unless Rails.env == 'test'
  require 'prometheus_exporter/middleware'

  # Set a non local client for a remote server
  PrometheusExporter::Client.default = PrometheusExporter::Client.new(host: 'exporter')

  # This reports stats per request like HTTP status and timings
  Rails.application.middleware.unshift PrometheusExporter::Middleware
end
