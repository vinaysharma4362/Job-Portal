# frozen_string_literal: true

# User model
class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :resume
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum active: %i[Online Offline]
<<<<<<< Updated upstream
  has_many :apply_job
  has_one :review, dependent: :destroy
=======
  has_many :apply_job, dependent: :destroy
  has_many :reviews, dependent: :destroy
>>>>>>> Stashed changes
  has_many :job_posts, through: :apply_job
  has_one :resume
end
