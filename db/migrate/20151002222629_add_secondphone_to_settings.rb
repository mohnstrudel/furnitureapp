class AddSecondphoneToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :phone2, :string
  end
end
