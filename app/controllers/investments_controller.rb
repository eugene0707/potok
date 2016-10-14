class InvestmentsController < ApplicationController

  before_action :fetch_investment_stats, only: :index, if: -> { current_user.try(:investor?) }

  def login_as_investor
    investor = User.where(role: 0).first
    sign_in(:user, investor) if investor.present?
    redirect_to root_path
  end

  private

  def fetch_investment_stats
    investment = current_user.investments.first
    gon.investment_stats = Investment.stats(investment)
  end

end
