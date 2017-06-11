# frozen_string_literal: true

class Manufacturer < ApplicationRecord
  has_many :matrices
  validates :name, uniqueness: true
  validates :symbol, uniqueness: true
end
