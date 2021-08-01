module HomeHelper

  def days_remaining(return_date)
    remaining_days = (return_date.to_date - Date.today).to_i

    if remaining_days > 0
      "#{remaining_days} day(s) until return"
    else
      "#{remaining_days.abs} day(s) late"
    end
  end

  def books
    Book.available
  end

  def users
    User.all
  end
end