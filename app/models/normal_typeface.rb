# frozen_string_literal: true

class NormalTypeface < ApplicationRecord
  has_many :matrices
  validates :typeface_id, uniqueness: true
end
