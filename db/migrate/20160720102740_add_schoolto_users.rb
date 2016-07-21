class AddSchooltoUsers < ActiveRecord::Migration
  def change
    add_reference :users, :school, foreign_key:true
  end
end
