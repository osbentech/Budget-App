# frozen_string_literal: true

class CategoryPurchase < ApplicationRecord
  belongs_to :category
  belongs_to :purchase
end
