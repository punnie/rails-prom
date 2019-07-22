# frozen_string_literal: true

require "#{Rails.root}/lib/prometheus"

class Cointoss < ApplicationRecord
  # Avoid in real life
  before_save :set_result

  validates :parameters,
            presence: true,
            format: { with: /\d+/, message: 'must be a number' }

  def set_result
    self.result = parameters.to_i.times.map { |_t|
      result = %w[heads tails].sample

      Prometheus.counters["cointosses_#{result}"].observe(1)

      result
    }.join(', ')
  end

  def formatted_result
    self.result.split(',').map(&:strip)
  end
end
