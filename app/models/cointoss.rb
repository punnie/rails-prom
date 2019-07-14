# frozen_string_literal: true

class Cointoss < ApplicationRecord
  # Avoid in real life
  before_save :set_result

  validates :parameters,
            presence: true,
            format: { with: /\d+/, message: 'must be a number' }

  def set_result
    self.result = parameters.to_i.times.map { |_|
      sleep 0.5
      %w[heads tails].sample
    }.join(', ')
  end

  def formatted_result
    self.result.split(',').map(&:strip)
  end
end
