# frozen_string_literal: true

class AddAux1TypefaceToMatrices < ActiveRecord::Migration[5.0]
  def change
    add_reference :matrices, :aux1_typeface, foreign_key: true
  end
end
