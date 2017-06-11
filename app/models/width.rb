# frozen_string_literal: true

class Width < ApplicationRecord
  has_many :typefaces
  validates :width, uniqueness: true
end
