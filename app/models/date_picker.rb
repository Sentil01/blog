class DatePicker
  attr_reader :date_from, :date_to

  def initialize(params)
    params ||= {}
    @date_from = parsed_date(params[:date_from], 1.days.ago.to_date.to_s)
    @date_to = parsed_date(params[:date_to],(Date.today+1).to_s)
  end
  def scope
    Post.where('created_at BETWEEN ? AND ?',@date_from,@date_to)
  end
  private
  def parsed_date(date_str,default)
    Date.parse(date_str)
  rescue ArgumentError,TypeError
    default

  end
end