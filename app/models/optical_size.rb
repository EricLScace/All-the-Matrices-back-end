# frozen_string_literal: true

class OpticalSize < ApplicationRecord
  has_many :typefaces
  validates :points, uniqueness: true
end
