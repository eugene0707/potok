# == Schema Information
#
# Table name: loan_payments
#
#  id         :integer          not null, primary key
#  loan_id    :integer          not null
#  amount     :decimal(15, 2)   not null
#  period     :integer          not null
#  is_overdue :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class LoanPayment < ActiveRecord::Base

  belongs_to :loan

  validates_presence_of :loan, :period, :amount
  validates_numericality_of :period, greater_than: 0, less_than_or_equal_to: lambda {|payment| payment.loan.term }
  validates_numericality_of :amount, greater_than: 0

end
