# frozen_string_literal: true

class Typeface < ApplicationRecord
  has_many :normal_typefaces
  has_many :aux1_typefaces
  has_many :aux2_typefaces
end
