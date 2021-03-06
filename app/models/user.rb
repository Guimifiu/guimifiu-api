class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :price_suggestions
  # has_many :gas_stations_price_suggestions, through: :price_suggestions, class_name: 'GasStation'
  has_many :fuel_supplies
  # has_many :gas_stations_fuel_supplies, through: :fuel_supplies, class_name: 'GasStation'
  has_many :ratings
  # has_many :gas_stations_ratings, through: :ratings, class_name: 'GasStation'

  validates :document_number, uniqueness: false, allow_nil: true
  validates :email, uniqueness: true
  validates :name, :surname, :email, presence: true

  def fuel_supply_history_months
    fuel_supplies_dates = []
    self.fuel_supplies.order('created_at DESC').each do |f|
      fuel_supplies_dates << f.created_at.strftime('%m/%Y')
    end
    fuel_supplies_dates.uniq
  end
end
