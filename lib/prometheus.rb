# frozen_string_literal: true

require 'prometheus_exporter/client'

class Prometheus
  include Singleton

  def client
    @client ||= PrometheusExporter::Client.default
  end

  def self.counters(*args)
    instance.counters(*args)
  end

  def counters
    @counters ||= Hash.new do |hash, key|
      hash[key] = client.register(:counter, key, "count of #{key}")
    end
  end
end
