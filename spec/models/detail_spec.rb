require 'rails_helper'

RSpec.describe Detail, type: :model do
  describe 'detail model' do
    user = User.new(firstname: 'spencer', surname: 'okyere', email: 'test@gmail.com', password: '123456')
    subject { Detail.new(name: 'Payment to ABC company', amount: 4, user_id: user.id) }

    before { subject.save }

    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'amount should be present' do
      subject.amount = nil
      expect(subject).to_not be_valid
    end

    it 'name should 50 characters or less' do
      subject.name = 'a' * 51
      expect(subject).to_not be_valid
    end

    it 'amount to be an integer' do
      subject.amount = 'a'
      expect(subject).to_not be_valid
    end
  end
end
