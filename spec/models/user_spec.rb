require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validation' do
    let(:now) { DateTime.now }

    describe 'Fill attributes' do
      let(:random_int) { rand(0...10) }

      it 'when save! should return true' do
        user = described_class.new(
          app_name: "Test", confirmation_sent_at: nil, confirmation_token: nil, confirmed_at: nil,
          email: "test@example.com", encrypted_password: "password#{random_int}", password: 'password',
          failed_attempts: random_int, locked_at: now, provider: 'email', remember_created_at: now,
          reset_password_sent_at: now, reset_password_token: "token#{random_int}", uid: random_int,
          unconfirmed_email: nil, unlock_token: "token", app_id: random_int
        )
        expect(user.save).to be_truthy
      end
    end

    describe 'index_users_on_uid_and_provider_and_app_id' do
      context 'When duplicated uid & provider & app_id' do
        let(:user) { create(:user) }

        it 'save! should raise ActiveRecord::RecordNotUnique Error' do
          duplicated_user = build(:user, uid: user.uid, provider: user.provider, app_id: user.app_id)
          expect { duplicated_user.save! }.to raise_error(ActiveRecord::RecordNotUnique)
        end
      end
    end
  end
end
