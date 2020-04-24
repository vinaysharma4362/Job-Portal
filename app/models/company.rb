# frozen_string_literal: true

# company model
class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :social_links, inverse_of: :company
  accepts_nested_attributes_for :social_links,
                                reject_if: :all_blank, allow_destroy: true
  has_rich_text :about
  has_one_attached :logo
  has_many :reviews, dependent: :destroy
  has_many :job_posts, dependent: :destroy

  enum status: %i[inactive active]

  validates :title, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :country, presence: true
  validates :pincode, presence: true
  # validates :email, format: { with: /[^@]+@[^\.]+\..+/,
  #                             message: 'Enter valid email address' }
  # validates :password, length: { in: 6..20,
  #                                message: 'Password length (between 6-20)' }
  validates :contact_no, presence: { message: 'Enter valid Mobile' },
                         numericality: true,
                         length: { minimum: 10, maximum: 15 }

  def thumbnail
    logo.variant(resize: '150x150')
  end
end
