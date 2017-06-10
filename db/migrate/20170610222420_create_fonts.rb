class CreateFonts < ActiveRecord::Migration[5.0]
  def change
    create_table :fonts do |t|
      t.text :font

      t.timestamps
    end
  end
end
