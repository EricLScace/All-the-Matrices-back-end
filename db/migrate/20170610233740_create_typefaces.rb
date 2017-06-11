# frozen_string_literal: true

class CreateTypefaces < ActiveRecord::Migration[5.0]
  def change
    create_table :typefaces do |t|
      t.belongs_to :optical_size, index: true
      t.belongs_to :font, index: true
      t.belongs_to :face, index: true, default: '(roman)'
      t.belongs_to :weight, index: true, default: '(regular)'
      t.belongs_to :width, index: true, default: '(normal)'
      t.belongs_to :orientation, index: true, default: '(horizontal)'
      t.timestamps
    end
  end
end
