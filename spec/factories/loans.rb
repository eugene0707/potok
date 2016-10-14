# == Schema Information
#
# Table name: loans
#  id            :integer          not null, primary key
#  user_id       :integer          not null
#  investment_id :integer          not null
#  amount        :integer          not null
#  term          :integer          not null
#  interest_rate :decimal(5, 4)    default(0.5), not null
#  penalty_rate  :decimal(5, 4)    default(0.5), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

FactoryGirl.define do
  factory :loan do
    user { create :user, :borrower }
    investment { create :investment }
    amount 1000
    term 3
    interest_rate 0.12
    penalty_rate 0.24
  end
end
