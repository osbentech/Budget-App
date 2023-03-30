require 'rails_helper'

RSpec.describe 'Purchase', type: :feature do
  describe 'Index' do
    before(:each) do
      @user = User.create!(name: 'Test', email: 'test@gmail.com', password: '123456')
      @category = Category.create!(name: 'Test', icon: 'https://as1.ftcdn.net/v2/jpg/01/93/61/82/1000_F_193618296_24g9muYFJL9f38ZWHb7WSk36FXwcef7X.jpg',
                                   user_id: @user.id)
      @purchase = Purchase.new(name: 'Accomodation', amount: 10.2, user_id: @user.id, category_ids: [@category.id])
      @user.skip_confirmation!
      @user.save!
      visit new_user_session_path
      fill_in 'user_email', with: 'test@gmail.com'
      fill_in 'user_password', with: '123456'
      click_button 'Log in'
      visit purchases_path(category_id: @category.id, category_name: @category.name)
    end

    it 'should show all purchases' do
      expect(page).to have_content('New purchase')
    end

    it 'should show the transactions' do
      expect(page).to have_content('Transactions')
    end

    it 'should show the new purchases button' do
      expect(page).to have_content('New purchase')
    end

    it 'should add a new purchase' do
      click_link('New purchase')
      expect(page).to have_current_path(new_purchase_path)
    end
  end
end