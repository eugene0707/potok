class InvestmentsController < ApplicationController

  before_action :fetch_investment_stats, only: :index, if: -> { current_user.try(:investor?) }

  def login_as_investor
    investor = User.where(role: 0).first
    sign_in(:user, investor) if investor.present?
    redirect_to root_path
  end

  private

  def fetch_investment_stats
    investment_stats = build_investment_stat
    investment = current_user.investments.first
    begin
      investment_stats.total_amount = investment.total_amount
      investment_stats.term = investment.term
      investment_stats.interest_rate = investment.interest_rate.to_f
      investment_stats.expected_income = investment.expected_income
      investment_stats.expected_profit = investment.expected_profit
      investment_stats.actual_income = investment.actual_income
      investment_stats.actual_rate = investment.actual_rate
      investment_stats.actual_profit = investment.actual_profit
    end if investment

    gon.investment_stats = investment_stats.to_h
  end

  def build_investment_stat
    investment_stats = OpenStruct.new
    investment_stats.total_amount = 0
    investment_stats.term = 0
    investment_stats.interest_rate = 0
    investment_stats.expected_income = 0
    investment_stats.expected_profit = 0
    investment_stats.actual_income = 0
    investment_stats.actual_rate = 0
    investment_stats.actual_profit = 0
    investment_stats
  end

end
