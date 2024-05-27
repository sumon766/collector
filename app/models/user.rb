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

end
