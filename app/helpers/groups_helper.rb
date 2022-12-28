module GroupsHelper
  def total_amount_helper(expenditures)
   number_to_currency(expenditures.reduce(0) { |sum, expenditure| sum + expenditure.amount })
  end
end
