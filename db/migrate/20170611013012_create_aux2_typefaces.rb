# frozen_string_literal: true

class CreateAux2Typefaces < ActiveRecord::Migration[5.0]
  def change
    create_table :aux2_typefaces do |t|
      t.belongs_to :typeface
      t.timestamps
    end
  end
end
