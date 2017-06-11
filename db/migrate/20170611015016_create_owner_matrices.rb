# frozen_string_literal: true

class CreateOwnerMatrices < ActiveRecord::Migration[5.0]
  def change
    create_table :owner_matrices do |t|
      t.references :user, foreign_key: true
      t.references :matrix, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
