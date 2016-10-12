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

RSpec.describe Investment, type: :model do
  context 'instance' do
    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:term) }
    it { is_expected.to respond_to(:interest_rate) }
  end
end
