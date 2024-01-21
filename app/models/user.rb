class User < ApplicationRecord
  has_many :tasks
  has_many :categories
  devise :database_authenticatable, :registerable, :validatable
end
