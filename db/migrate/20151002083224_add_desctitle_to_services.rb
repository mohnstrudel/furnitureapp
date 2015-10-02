class AddDesctitleToServices < ActiveRecord::Migration
  def change
    add_column :services, :desctitle, :string
  end
end
