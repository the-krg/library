module HomeHelper
  def days_remaining(return_date)
    days_left = remaining_days(return_date)

    if days_left > 0
      "#{days_left} day(s) until return"
    elsif days_left < 0
      "#{days_left.abs} day(s) late"
    else
      "Returns today"
    end
  end

  def rental_status(return_date)
    if remaining_days(return_date) < 0
      'warning' 
    elsif remaining_days(return_date) == 0
      'alert'
    end
  end

  def books
    Book.available
  end

  def users
    User.all
  end

  private

  def remaining_days(return_date)
    (return_date.to_date - Date.today).to_i
  end
end