class CreateOpticalSizes < ActiveRecord::Migration[5.0]
  def change
    create_table :optical_sizes do |t|
      t.decimal :points, scale: git pus3

      t.timestamps
    end
  end
end
