class AddFirstToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :surname, :string
    add_column :members, :name, :string
    add_column :members, :kana_surname, :string
    add_column :members, :kana_name, :string
    add_column :members, :postal_code, :string
    add_column :members, :address, :text
    add_column :members, :phone, :string
    add_column :members, :quit, :boolean
  end
end
