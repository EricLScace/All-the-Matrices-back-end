# frozen_string_literal: true

class Face < ApplicationRecord
  has_many :typefaces
  validates :face, uniqueness: true
end
