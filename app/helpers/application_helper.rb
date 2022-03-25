module ApplicationHelper
  def number_to_euros(value)
    number_to_currency(value, :unit=>'€', format: "%n %u")
  end
end
