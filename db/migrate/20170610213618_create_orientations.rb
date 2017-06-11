# frozen_string_literal: true

class CreateOrientations < ActiveRecord::Migration[5.0]
  def change
    create_table :orientations do |t|
      t.text :orientation

      t.timestamps
    end
  end
end
