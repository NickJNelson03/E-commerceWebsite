class User < ApplicationRecord
  # Associations
  has_one :cart, dependent: :destroy

  # Callbacks
  after_create :create_cart

  # Validations
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private

  def create_cart
    self.create_cart!
  end
end
