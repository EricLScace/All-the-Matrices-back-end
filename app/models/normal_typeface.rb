# frozen_string_literal: true

class NormalTypeface < ApplicationRecord
  has_many :matrices
  validates :typeface, uniqueness: true
end
