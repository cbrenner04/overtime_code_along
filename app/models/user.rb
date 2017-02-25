# frozen_string_literal: true
# no doc
class User < ApplicationRecord
  ADMIN_USER_TYPE = "AdminUser"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, :last_name, :phone, presence: true
  has_many :posts
  has_many :audit_logs

  PHONE_REGEX = /\A[0-9]*\Z/

  validates :phone, format: PHONE_REGEX
  validates :phone, length: { is: 10 }

  def full_name
    "#{last_name.upcase}, #{first_name.upcase}"
  end

  def admin?
    type == ADMIN_USER_TYPE
  end
end
