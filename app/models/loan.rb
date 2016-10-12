# == Schema Information
#
# Table name: loans
#
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

class Loan < ActiveRecord::Base

  belongs_to :user
  belongs_to :investment

  has_many :loan_payments

  validates_presence_of :user, :investment, :amount, :term, :interest_rate, :penalty_rate
  validates_numericality_of :amount, :term, greater_than: 0
  validates_numericality_of :interest_rate, greater_than_or_equal_to: 0, less_than_or_equal_to: 1
  validates_numericality_of :penalty_rate, greater_than_or_equal_to: 0, less_than_or_equal_to: 1
  validates_uniqueness_of :user_id, scope: :investment_id

  def total_payments
    @total_payments ||= loan_payments.sum(:amount)
    @total_payments
  end

end
