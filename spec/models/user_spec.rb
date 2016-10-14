# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  role                   :integer
#

require 'rails_helper'

RSpec.describe User do
  context 'instance' do
    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:email) }
    it { is_expected.to respond_to(:role) }
    it { is_expected.to have_many(:investments) }
    it { is_expected.to have_many(:loans) }
    it { is_expected.to define_enum_for(:role).with([:investor, :borrower, :admin]) }
  end

  context 'defaults' do
    subject { create :user }
    its(:role) { is_expected.to eq('investor') }
  end
end
