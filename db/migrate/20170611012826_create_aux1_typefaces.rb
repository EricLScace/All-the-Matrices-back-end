class CreateAux1Typefaces < ActiveRecord::Migration[5.0]
  def change
    create_table :aux1_typefaces do |t|
      t.belongs_to :typeface
      t.timestamps
    end
  end
end
