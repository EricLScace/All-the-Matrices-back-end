# frozen_string_literal: true

class Font < ApplicationRecord
  has_many :typefaces
  validates :font, uniqueness: true
end
