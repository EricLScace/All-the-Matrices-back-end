# frozen_string_literal: true

class CreateMatrices < ActiveRecord::Migration[5.0]
  def change
    create_table :matrices do |t|
      t.belongs_to :manufacturer, index: true
      t.decimal :code_prefix, scale: 2, precision: 6
      t.integer :code_suffix
      # t.index :typeface, name: typeface_normal_id
      # t.index :typeface, name: typeface_auxiliary1_id
      # t.index :typeface, name: typeface_auxiliary2_id
      t.timestamps
    end
  end
end
