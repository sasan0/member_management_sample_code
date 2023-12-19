class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.integer :grade, null: false
      t.string :student_num, null: false
      t.boolean :is_multiple, null: false

      t.timestamps
    end
  end
end
