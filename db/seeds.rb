user = User.find_or_create_by!(email: 'admin@example.com') do |user|
  user.name = 'Администратор'
  user.password = 'password'
  user.password_confirmation = 'password'
  user.admin!
end
puts "CREATED ADMIN USER: #{user.email}"

user = User.find_or_create_by!(email: 'investor1@example.com') do |user|
  user.name = 'Инвестор 1'
  user.password = 'password'
  user.password_confirmation = 'password'
  user.investor!
end
puts "CREATED INVESTOR USER: #{user.email}"

4.times do |i|
  user = User.find_or_create_by!(email: "borrower#{i + 1}@example.com") do |user|
    user.name = "ЮЛ#{i + 1}"
    user.password = 'password'
    user.password_confirmation = 'password'
    user.borrower!
  end
  puts "CREATED BORROWER USER: #{user.email}"
end

investment = Investment.find_or_create_by!(user_id: User.where(role: 0).first.id) do |investment|
  investment.name = 'Инвестиционный пакет 1'
  investment.term = 6
  investment.interest_rate = 0.3
end
puts "CREATED INVESTMENT: #{investment.name}"

4.times do |i|
  loan = Loan.find_or_create_by!(user_id: User.find_by_email("borrower#{i + 1}@example.com").id, investment_id: Investment.first.id) do |loan|
    loan.amount = 1000000
    loan.term = 6
    loan.interest_rate = 0.3
    loan.penalty_rate = 0.5
  end
  puts "CREATED LOAN: #{loan.user.name}"
end

current_loan = Loan.find_by(user_id: User.find_by_email('borrower1@example.com').id, investment_id: Investment.first.id)
6.times do |i|
  current_loan.loan_payments.find_or_create_by!(period: i + 1) {|payment| payment.amount = 191666.67 }
end
puts "CREATED PAYMENTS FOR LOAN: #{current_loan.user.name}"

current_loan = Loan.find_by(user_id: User.find_by_email('borrower2@example.com').id, investment_id: Investment.first.id)
current_loan.loan_payments.find_or_create_by!(period: 1) {|payment| payment.amount = 191666.67 }
current_loan.loan_payments.find_or_create_by!(period: 2) {|payment| payment.amount = 191666.67 }
current_loan.loan_payments.find_or_create_by!(period: 3) {|payment| payment.amount = 191666.67 }
current_loan.loan_payments.find_or_create_by!(period: 4) {|payment| payment.amount = 525000.00 }
puts "CREATED PAYMENTS FOR LOAN: #{current_loan.user.name}"

current_loan = Loan.find_by(user_id: User.find_by_email('borrower3@example.com').id, investment_id: Investment.first.id)
current_loan.loan_payments.find_or_create_by!(period: 1) {|payment| payment.amount = 191666.67 }
current_loan.loan_payments.find_or_create_by!(period: 2) {|payment| payment.amount = 191666.67 }
current_loan.loan_payments.find_or_create_by!(period: 3) {|payment| payment.amount = 208333.33 and payment.is_overdue = true }
current_loan.loan_payments.find_or_create_by!(period: 4) {|payment| payment.amount = 208333.33 and payment.is_overdue = true }
current_loan.loan_payments.find_or_create_by!(period: 5) {|payment| payment.amount = 208333.33 and payment.is_overdue = true }
current_loan.loan_payments.find_or_create_by!(period: 6) {|payment| payment.amount = 208333.33 and payment.is_overdue = true }
puts "CREATED PAYMENTS FOR LOAN: #{current_loan.user.name}"

current_loan = Loan.find_by(user_id: User.find_by_email('borrower4@example.com').id, investment_id: Investment.first.id)
current_loan.loan_payments.find_or_create_by!(period: 1) {|payment| payment.amount = 191666.67 }
current_loan.loan_payments.find_or_create_by!(period: 2) {|payment| payment.amount = 191666.67 }
current_loan.loan_payments.find_or_create_by!(period: 3) {|payment| payment.amount = 191666.67 }
current_loan.loan_payments.find_or_create_by!(period: 4) {|payment| payment.amount = 191666.67 }
current_loan.loan_payments.find_or_create_by!(period: 5) {|payment| payment.amount = 208333.33 and payment.is_overdue = true }
current_loan.loan_payments.find_or_create_by!(period: 6) {|payment| payment.amount = 208333.33 and payment.is_overdue = true }
puts "CREATED PAYMENTS FOR LOAN: #{current_loan.user.name}"
