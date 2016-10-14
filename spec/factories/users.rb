# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  role                   :integer
#

FactoryGirl.define do
  factory :user do
    name 'Test User'
    email 'test@example.com'
    password 'please123'

    trait :admin do
      email 'admin@example.com'
      role 'admin'
    end

    trait :borrower do
      email 'borrower@example.com'
      role 'borrower'
    end
  end
end
