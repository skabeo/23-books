require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'category model' do
    user = User.new(firstname: 'spencer', surname: 'okyere', email: 'test@gmail.com', password: '123456')
    subject { Category.new(name: 'Expense', icon: 'category-icon', user_id: user.id) }
    before { subject.save }

    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'icon should be present' do
      subject.icon = nil
      expect(subject).to_not be_valid
    end

    it 'name should be 50 characters or less' do
      subject.name = 'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum'
      expect(subject).to_not be_valid
    end

    it 'icon should be 350 characters or less' do
      subject.icon = 'a' * 351
      expect(subject).to_not be_valid
    end
  end
end
