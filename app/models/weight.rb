# frozen_string_literal: true

class Weight < ApplicationRecord
  has_many :typefaces
  validates :weight, uniqueness: true
end
