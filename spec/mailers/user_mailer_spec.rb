require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe 'account_activation' do
    user = User.first
    let(:mail) { UserMailer.account_activation(user) }

    it 'renders the headers' do
      user.activation_token = User.new_token
      expect(mail.subject).to eq('Ativação da Conta')
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(['noreply@example.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match(user.first_name)
      expect(mail.body.encoded).to match(user.activation_token)
    end
  end

end
