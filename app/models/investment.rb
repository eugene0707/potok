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

class Investment < ActiveRecord::Base

  belongs_to :user

  has_many :loans

  validates_presence_of :user, :name, :term, :interest_rate
  validates_numericality_of :term, greater_than: 0
  validates_numericality_of :interest_rate, greater_than_or_equal_to: 0, less_than_or_equal_to: 1

  def self.stats(instance = nil)
    investment_stats = {}
    investment_stats[:total_amount] = instance.try(:total_amount) || 0
    investment_stats[:term] = instance.try(:term) || 0
    investment_stats[:interest_rate] = instance.try(:interest_rate).to_f || 0
    investment_stats[:expected_income] = instance.try(:expected_income) || 0
    investment_stats[:expected_profit] = instance.try(:expected_profit) || 0
    investment_stats[:actual_income] = instance.try(:actual_income) || 0
    investment_stats[:actual_rate] = instance.try(:actual_rate) || 0
    investment_stats[:actual_profit] = instance.try(:actual_profit) || 0
    investment_stats
  end


  def total_amount
    @total_amount ||= loans.sum(:amount)
    @total_amount
  end

  def expected_profit
    (total_amount * interest_rate).truncate(2).to_f
  end

  def expected_income
    total_amount + expected_profit
  end

  def actual_income
    @actual_income ||= loans.to_a.sum(&:total_payments).truncate(2).to_f
    @actual_income
  end

  def actual_rate
    ((actual_income / total_amount - 1) * (12 / term)).round(4)
  end

  def actual_profit
    actual_income - total_amount
  end

end
