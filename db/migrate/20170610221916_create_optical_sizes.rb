class CreateOpticalSizes < ActiveRecord::Migration[5.0]
  def change
    create_table :optical_sizes do |t|
      t.decimal :points, scale: 2, precision: 6

      t.timestamps
    end
  end
end
