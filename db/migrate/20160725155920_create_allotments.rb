class CreateAllotments < ActiveRecord::Migration
  def change
    create_table :allotments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :school, index: true, foreign_key: true
      t.references :class_mapping, index: true, foreign_key: true
      t.string :role
    end
  end
end
