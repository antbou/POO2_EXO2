class Category < ActiveRecord::Base
  has_many :products

  def to_s
    "#{name}"
  end

  def self.no_need
    arr = []
    self.all.each do |category|
      if (category.products.count == 0)
        arr << category
      end
    end
    return arr
  end
end
