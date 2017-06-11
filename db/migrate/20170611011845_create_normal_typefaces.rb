# frozen_string_literal: true

class CreateNormalTypefaces < ActiveRecord::Migration[5.0]
  def change
    create_table :normal_typefaces do |t|
      t.belongs_to :typeface
      t.timestamps
    end
  end
end
