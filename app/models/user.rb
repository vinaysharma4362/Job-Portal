# frozen_string_literal: true

# User model
class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :assign_default_role

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum active: %i[Online Offline]
  enum gender: %i[male female other]
  has_many :apply_job, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :job_posts, through: :apply_job
  has_one :resume, dependent: :destroy

  validates :email, format: { with: /[^@]+@[^\.]+\..+/,
                              message: 'Enter valid email address' }
  validates :first_name, format: { with: /[a-zA-Z]/,
                                   message: 'Enter valid First Name' }
  validates :last_name, format: { with: /[a-zA-Z]/,
                                  message: 'Enter valid Last Name' }
  # validates :password, length: { in: 6..20,
  #                                message: 'Password length (between 6-20)' },
  #  if: :password
  validates :mobile, presence: { message: 'Enter valid Mobile' },
                     numericality: true,
                     length: { minimum: 10, maximum: 15 }

  scope :online, -> { where('last_seen_at > ?', 15.minutes.ago) }

  def gravatar
    hash = Digest::MD5.hexdigest(email.downcase)
    "https://www.gravatar.com/avatar/#{hash}"
  end

  private

  def assign_default_role
    add_role(:job_seeker)
  end
end
