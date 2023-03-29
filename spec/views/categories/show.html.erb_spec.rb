# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'categories/show', type: :view do
  before(:each) do
    assign(:category, Category.create!(
                        name: 'Name',
                        icon: 'Icon',
                        user: nil
                      ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Icon/)
    expect(rendered).to match(//)
  end
end
