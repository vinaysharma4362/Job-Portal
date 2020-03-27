# frozen_string_literal: true

class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

<<<<<<< Updated upstream
  has_many :posts, dependent: :destroy
=======
  has_many :job_posts, dependent: :destroy
  enum status: %i[inactive active]
>>>>>>> Stashed changes
end
