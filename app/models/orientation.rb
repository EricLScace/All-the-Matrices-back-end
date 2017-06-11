# frozen_string_literal: true

class Orientation < ApplicationRecord
  has_many :typefaces
  validates :orientation, uniqueness: true
end
