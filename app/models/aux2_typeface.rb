# frozen_string_literal: true

class Aux2Typeface < ApplicationRecord
  has_many :matrices
  validates :typeface_id, uniqueness: true
end
