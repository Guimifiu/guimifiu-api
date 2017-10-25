class Api::V1::FuelSuppliesChartsController < ApiController

  before_action :set_user, only: [:monthly_chart]

  def monthly_chart
      labels = @user.fuel_supply_history_months.take(6)
      gas_data = get_monthly_chart_data(labels, 'gas')
      diesel_data = get_monthly_chart_data(labels, 'diesel')
      alcohol_data = get_monthly_chart_data(labels, 'alcohol')
      @response = {
          labels: labels,
          alcohol_data: alcohol_data,
          diesel_data: diesel_data,
          gas_data: gas_data
      }
      render json: @response
  end

  private
  def set_user
    @user = User.find_by_id(params[:user_id])
  end

  def get_monthly_chart_data(labels, fuel_type)
      data = []
      labels.each do |label|
          puts label
          month_fuel_supplies = @user.fuel_supplies.select { |f| f.created_at.strftime('%m/%Y') == label && f.fuel_type == fuel_type }
          value_sum = 0
          month_fuel_supplies.each do |month_fuel_supply|
              value_sum += month_fuel_supply.value if !month_fuel_supply.value.nil?
          end
          data << value_sum
      end
      return data
  end

end
