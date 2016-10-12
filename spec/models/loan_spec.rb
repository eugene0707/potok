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
  end
end
