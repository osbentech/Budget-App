# frozen_string_literal: true

class CreateJoinTableCategoryPurchase < ActiveRecord::Migration[7.0]
  def change
    create_join_table :categories, :purchases do |t|
      t.index :category_id
      t.index :purchase_id
      # t.index [:category_id, :purchase_id]
      # t.index [:purchase_id, :category_id]
    end
  end
end