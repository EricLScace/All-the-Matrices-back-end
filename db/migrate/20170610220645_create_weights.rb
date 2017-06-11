# frozen_string_literal: true

class CreateWeights < ActiveRecord::Migration[5.0]
  def change
    create_table :weights do |t|
      t.text :weight

      t.timestamps
    end
  end
end
