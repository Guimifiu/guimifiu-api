class Distributor < ApplicationRecord
    validates :name, uniqueness: true
end
