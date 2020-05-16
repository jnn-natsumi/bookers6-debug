class CreateBookComments < ActiveRecord::Migration[5.2]
  def change
    create_table :book_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :book_id
      # foreign_key: trueをuser_id,book_idにつけなくていいのか

      t.timestamps
    end
  end
end
