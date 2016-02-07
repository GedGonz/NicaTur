class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :Titutlo
      t.string :body
      t.string :imag
    end
  end
end
