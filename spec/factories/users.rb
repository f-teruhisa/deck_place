# == Schema Information
#
# Table name: users
#
#  id                                             :bigint           not null, primary key
#  app_name(Player Name in DuelMasters-Plays app) :string(255)
#  confirmation_sent_at                           :datetime
#  confirmation_token                             :string(255)
#  confirmed_at                                   :datetime
#  email                                          :string(255)      default(""), not null
#  encrypted_password                             :string(255)      default(""), not null
#  failed_attempts                                :integer          default(0), not null
#  locked_at                                      :datetime
#  provider                                       :string(255)      default("email"), not null
#  remember_created_at                            :datetime
#  reset_password_sent_at                         :datetime
#  reset_password_token                           :string(255)
#  uid                                            :string(255)      default(""), not null
#  unconfirmed_email                              :string(255)
#  unlock_token                                   :string(255)
#  created_at                                     :datetime         not null
#  updated_at                                     :datetime         not null
#  app_id(Player ID in DuelMasters-Plays app)     :integer
#
# Indexes
#
#  index_users_on_confirmation_token           (confirmation_token) UNIQUE
#  index_users_on_email                        (email) UNIQUE
#  index_users_on_reset_password_token         (reset_password_token) UNIQUE
#  index_users_on_uid_and_provider_and_app_id  (uid,provider,app_id) UNIQUE
#  index_users_on_unlock_token                 (unlock_token) UNIQUE
#
FactoryBot.define do
  factory :user, class: User do
    now = DateTime.now
    sequence(:id) { |i| i }
    sequence(:app_name) { |i| "Test#{i}" }
    confirmation_sent_at { nil }
    confirmation_token { nil }
    confirmed_at { nil }
    sequence(:email) { |i| "test#{i}@example.com" }
    encrypted_password { 'password' }
    password { 'password' }
    failed_attempts { 0 }
    locked_at { nil }
    provider { 'email' }
    remember_created_at { now }
    reset_password_sent_at { now }
    sequence(:reset_password_token) { |i| "token#{i}" }
    sequence(:uid, &:to_s)
    unconfirmed_email { nil }
    sequence(:unlock_token) { |i| "token#{i}" }
    sequence(:app_id, &:to_s)

    trait :google do
      provider { 'google_oauth2' }
    end
  end
end
