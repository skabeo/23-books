require 'rails_helper'

RSpec.feature 'category index', type: :feature do
  before(:each) do
    @user = User.create!(firstname: 'Spencer',
                         surname: 'Okyere',
                         email: 'test@gmail.com',
                         password: '1234567', password_confirmation: '1234567')
    @user.skip_confirmation!
    @category = Category.create(name: 'Expenses', icon: 'https://ibb.co/m8jnSJZ', user_id: @user.id)
  end

  scenario 'should display category by a user' do
    login_as(@user, scope: :user)

    visit categories_path
    expect(page).to have_content(@category.name)
  end

  scenario 'should display category icon' do
    login_as(@user, scope: :user)

    visit categories_path
    expect(page).to have_css("img[src*='#{@category.icon}']")
  end

  scenario 'should display add item image' do
    login_as(@user, scope: :user)

    visit categories_path
    expect(page).to have_selector('img.add-item')
  end

  scenario 'have category header' do
    login_as(@user, scope: :user)

    visit categories_path
    expect(page).to have_content('Categories')
  end
end
