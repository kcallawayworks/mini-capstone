class ChangePriceToCurrencyProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :price, "numeric USING CAST(price AS numeric)"
    change_column :products, :price, :decimal, precision: 9, scale: 2
  end
end


# Using decimals: add_column :products, :price, :decimal, precision: 5, scale: 2
# Precision is the total number of digits, scale is the number of digits after the decimal
# In this example, 103.42 is a valid price, 3432.21 isn’t (total digits is greater than precision)

# NOTE: postgres has issues changing strings to decimals, use these 2 lines in a migration:
#   change_column :products, :price, "numeric USING CAST(price AS numeric)"
#   change_column :products, :price, :decimal, precision: 9, scale: 2