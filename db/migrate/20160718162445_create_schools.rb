class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :school_name
      t.string :school_location
      t.string :school_contact
      t.string :school_admin

      t.timestamps null: false
    end
  end
end
