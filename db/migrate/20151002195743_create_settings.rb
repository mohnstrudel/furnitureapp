class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.text :about
      t.string :phone
      t.string :mail
      t.string :address

      t.timestamps null: false
    end
  end
end
