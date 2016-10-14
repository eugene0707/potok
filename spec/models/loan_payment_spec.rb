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

RSpec.describe LoanPayment do
  context 'instance' do
    it { is_expected.to respond_to(:amount) }
    it { is_expected.to respond_to(:period) }
    it { is_expected.to respond_to(:is_overdue) }
    it { is_expected.to belong_to(:loan) }
  end

  context 'validations' do
    subject { create :loan_payment }
    it { is_expected.to validate_presence_of(:amount) }
    it { is_expected.to validate_presence_of(:period) }
    it { expect(subject).to validate_numericality_of(:period).is_greater_than(0) }
    it { is_expected.to validate_numericality_of(:amount).is_greater_than(0) }
  end
end
