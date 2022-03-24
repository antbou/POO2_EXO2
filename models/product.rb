class Product < ActiveRecord::Base
  attribute :price
  belongs_to :category
  belongs_to :supplier
  has_many :orders
  has_many :comments, as: :target

  scope :cheap, -> { where('price <= 20') }

  after_save :check_inventory

  def to_s
    "#{name} #{price}"
  end

  def check_inventory
    if (inventory < 5)
      puts "Attention, le nombre de produit (#{name}) est en dessous de 5 (#{inventory})"
    end
  end
end