class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :document_number, uniqueness: false, allow_nil: true
  validates :email, uniqueness: true
  validates :name, :surname, :email, presence: true
end
