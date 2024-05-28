class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  #Pundit role assignment
  enum role: {user: 0, admin: 1}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  validates :name, presence: true

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  def active_for_authentication?
    super && status == 1
  end

  def inactive_message
    status == 0 ? :deactivated : super
  end

  def admin?
    role == 'admin'
  end
end
