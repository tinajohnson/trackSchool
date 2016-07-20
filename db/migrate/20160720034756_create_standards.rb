class CreateStandards < ActiveRecord::Migration
  def change
    create_table :standards do |t|
      t.string :standard_name
      t.string :string

      t.timestamps null: false
    end
  end
end
