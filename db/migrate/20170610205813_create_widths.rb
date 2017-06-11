# frozen_string_literal: true

class CreateWidths < ActiveRecord::Migration[5.0]
  def change
    create_table :widths do |t|
      t.text :width

      t.timestamps
    end
  end
end
