class Car < ApplicationRecord
  #car relation create
  belongs_to :mark
  belongs_to :model
  belongs_to :type
  belongs_to :energy
  belongs_to :city
  belongs_to :user
  #car relation for comments
  has_many :comments
  has_many :likes, dependent: :destroy
  #other relation
  has_many_attached :pictures
  #Validation
	validates :price, presence: true, numericality: {greater_than: 0}
	validates :description, presence: true, length: {maximum: 500}
	validates :etat, presence: true,length: {maximum: 40}
	validates :year, presence: true
  validates :mileage, presence: true, numericality: {greater_than: 0}
  validates :climatisation, presence: true, length: {maximum: 3}
  validates :transmission, presence: true, length: {maximum: 30}
  validates :telephone, presence: true, numericality: {minimum: 10, maximum: 15}
  validates :option, presence: true
end
