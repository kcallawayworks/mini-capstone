#will be updating with my own code, had to restore to get working copy

class Product < ApplicationRecord

  def is_discounted?
    price <= 10
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

end