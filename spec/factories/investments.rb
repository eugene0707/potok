# == Schema Information
#
# Table name: investments
#
#  id            :integer          not null, primary key
#  user_id       :integer          not null
#  name          :string           not null
#  term          :integer          not null
#  interest_rate :decimal(5, 4)    default(0.5), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

FactoryGirl.define do
  factory :investment do
    user { create :user }
    name 'test investment'
    term 3
    interest_rate 0.12
  end
end
