# frozen_string_literal: true

# User model
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :resume
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum active: %i[Online Offline]
end
