class RenameColumnsSchools < ActiveRecord::Migration
  def change
    rename_column :schools, :school_location, :location
    rename_column :schools, :school_admin, :admin
    rename_column :schools, :school_contact, :contact
  end
end
