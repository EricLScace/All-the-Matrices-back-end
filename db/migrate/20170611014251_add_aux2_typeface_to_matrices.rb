# frozen_string_literal: true

class AddAux2TypefaceToMatrices < ActiveRecord::Migration[5.0]
  def change
    add_reference :matrices, :aux2_typeface, foreign_key: true
  end
end
