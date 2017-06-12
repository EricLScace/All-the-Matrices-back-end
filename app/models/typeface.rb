# frozen_string_literal: true

class Typeface < ApplicationRecord
  has_many :aux1_typefaces
  has_many :aux2_typefaces
  has_many :normal_typefaces
  belongs_to :face
  belongs_to :font
  belongs_to :optical_size
  belongs_to :orientation
  belongs_to :weight
  belongs_to :width
end
