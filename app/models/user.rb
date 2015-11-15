class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_create :set_default_organization
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :buckets
  has_many :orders
  private
  def set_default_organization
      self.organization ||= "台灣黑客松"
  end
end
