# frozen_string_literal: true

class NormalTypeface < ApplicationRecord
  has_many :matrices
  belongs_to :typeface
  validates :typeface_id, uniqueness: true
end
