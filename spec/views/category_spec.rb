require 'rails_helper'

RSpec.describe 'Category', type: :feature do
  describe 'Index' do
    before(:each) do
      @user = User.create!(name: 'Test', email: 'test@gmail.com', password: '123456')
      @category = Category.create!(name: 'Test', icon: 'https://as1.ftcdn.net/v2/jpg/01/93/61/82/1000_F_193618296_24g9muYFJL9f38ZWHb7WSk36FXwcef7X.jpg',
                                   user_id: @user.id)
      @user.skip_confirmation!
      @user.save!
      visit new_user_session_path
      fill_in 'user_email', with: 'test@gmail.com'
      fill_in 'user_password', with: '123456'
      click_button 'Log in'
      visit '/'
    end

    it 'should show all categories' do
      expect(page).to have_content('Test')
    end

    it 'should show the show category button' do
      expect(page).to have_content('Show category')
    end

    it 'should show the view transactions button' do
      expect(page).to have_content('View Transactions')
    end

    it 'should add a new category' do
      click_link('New category')
      expect(page).to have_current_path(new_category_path)
    end
  end
end
