# frozen_string_literal: true

class AddNormalTypefaceToMatrices < ActiveRecord::Migration[5.0]
  def change
    add_reference :matrices, :normal_typeface, foreign_key: true
  end
end
