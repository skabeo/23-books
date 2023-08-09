require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User model' do
    subject { User.new(firstname: 'spencer', surname: 'okyere', email: 'test@gmail.com', password: '123456') }
    before { subject.save }

    it 'firstname should not be blank' do
      subject.firstname = nil
      expect(subject).to_not be_valid
    end

    it 'surname should not be blank' do
      subject.surname = nil
      expect(subject).to_not be_valid
    end

    it 'should be valid' do
      expect(subject).to be_valid
    end

    it 'should check firstname length' do
      subject.firstname = 'Lorem ipsum Lorem'
      expect(subject).to_not be_valid
    end

    it 'should check surname length' do
      subject.surname = 'Lorem ipsum Lorem'
      expect(subject).to_not be_valid
    end
  end
end
