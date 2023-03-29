# frozen_string_literal: true

json.extract! purchase, :id, :name, :amount, :user_id, :created_at, :updated_at
json.url purchase_url(purchase, format: :json)
