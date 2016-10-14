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

require 'rails_helper'

RSpec.describe Loan, type: :model do
  context 'instance' do
    it { is_expected.to respond_to(:amount) }
    it { is_expected.to respond_to(:term) }
    it { is_expected.to respond_to(:interest_rate) }
    it { is_expected.to respond_to(:penalty_rate) }
    it { is_expected.to respond_to(:total_payments) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:investment) }
    it { is_expected.to have_many(:loan_payments) }
  end

  context 'validations' do
    subject { create :loan }
    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:investment) }
    it { is_expected.to validate_presence_of(:term) }
    it { is_expected.to validate_presence_of(:amount) }
    it { is_expected.to validate_presence_of(:interest_rate) }
    it { is_expected.to validate_presence_of(:penalty_rate) }
    it { is_expected.to validate_numericality_of(:amount).is_greater_than(0) }
    it { is_expected.to validate_numericality_of(:term).is_greater_than(0) }
    it { is_expected.to validate_numericality_of(:interest_rate).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(1) }
    it { is_expected.to validate_numericality_of(:penalty_rate).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(1) }
    it { is_expected.to validate_uniqueness_of(:user_id).scoped_to(:investment_id) }
  end
end
