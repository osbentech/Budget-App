# frozen_string_literal: true

class Purchase < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories
end
