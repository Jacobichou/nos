class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :dept_name
      t.string :dept_director
      t.integer :staff_count

      t.timestamps
    end
  end
end
