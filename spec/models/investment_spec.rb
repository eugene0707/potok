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

require 'rails_helper'

RSpec.describe Investment do
  context 'instance' do
    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:term) }
    it { is_expected.to respond_to(:interest_rate) }
    it { is_expected.to respond_to(:total_amount) }
    it { is_expected.to respond_to(:expected_profit) }
    it { is_expected.to respond_to(:expected_income) }
    it { is_expected.to respond_to(:actual_income) }
    it { is_expected.to respond_to(:actual_rate) }
    it { is_expected.to respond_to(:actual_profit) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:loans) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:term) }
    it { is_expected.to validate_presence_of(:interest_rate) }
    it { is_expected.to validate_numericality_of(:term).is_greater_than(0) }
    it { is_expected.to validate_numericality_of(:interest_rate).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(1) }
  end
end
