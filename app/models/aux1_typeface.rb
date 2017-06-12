# frozen_string_literal: true

class Aux1Typeface < ApplicationRecord
  has_many :matrices
  belongs_to :typeface
  validates :typeface_id, uniqueness: true
end
