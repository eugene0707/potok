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

require 'rails_helper'

RSpec.describe LoanPayment, type: :model do
  context 'instance' do
    it { is_expected.to respond_to(:amount) }
    it { is_expected.to respond_to(:period) }
    it { is_expected.to respond_to(:is_overdue) }
  end
end
