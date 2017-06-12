# frozen_string_literal: true

class Matrix < ApplicationRecord
  has_many :users
  belongs_to :manufacturer
  belongs_to :normal_typeface
  belongs_to :aux1_typeface
  belongs_to :aux2_typeface
end
