# frozen_string_literal: true

class Diceroll < ApplicationRecord
  # Avoid in real life
  before_save :set_result

  validates :parameters,
            presence: true,
            format: { with: /\d+[dD]\d+/, message: 'must be a dice spec' }

  def set_result
    num, roll = parameters.split(/[dD]/)

    self.result = num.to_i.times.map { |_|
      1 + Random.rand(roll.to_i)
    }.sum
  end
end
