require 'json'
require 'date'
path          = File.join(File.dirname(__FILE__), '../data/products.json')
file          = File.read(path)
products_hash = JSON.parse(file)
brand_hash    = Hash.new

# Print today's date
puts 
puts "Today's Date: #{DateTime.now.strftime('%m/%d/%Y')}"

puts "                     _            _       "
puts "                    | |          | |      "
puts " _ __  _ __ ___   __| |_   _  ___| |_ ___ "
puts "| '_ \\| '__/ _ \\ / _` | | | |/ __| __/ __|"
puts "| |_) | | | (_) | (_| | |_| | (__| |_\\__ \\"
puts "| .__/|_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/"
puts "| |                                       "
puts "|_|                                       "


# For each product in the data set:
products_hash["items"].each do |toy|

  # Print the name of the toy
  puts "#{toy["title"]}"
  puts "**********************************"
  
  # Print the retail price of the toy
  retail_price = toy["full-price"].to_f
  puts "Retail Price: $#{retail_price}"
  
  # Calculate and print the total number of purchases
  number_of_purchases = toy["purchases"].size
  puts "Total Purchases: #{number_of_purchases}"
  
  # Calculate and print the total amount of sales
  total_sales_amount = 0.0
  toy["purchases"].each do |purchase|
        total_sales_amount += purchase["price"]
  end
  puts "Total Sales: $#{total_sales_amount}"
  
  # Calculate and print the average price the toy sold for
  average_sales_price = total_sales_amount / number_of_purchases
  puts "Average Price: $#{average_sales_price}"
  
  # Calculate and print the average discount (% or $) based off the average sales price
  average_discount = retail_price - average_sales_price
  puts "Average Discount: $#{average_discount}"
  puts "**********************************"
  puts

  # Build a new hash for brands
  brand = toy["brand"]
  brand_hash[brand] = { "stock" => 0, "number_of_products" => 0, "total_price" => 0.00, "total_sales" => 0.00 } unless brand_hash.has_key?(brand)
  brand_hash[brand]["stock"] = brand_hash[brand]["stock"] + toy["stock"]
  brand_hash[brand]["number_of_products"] = brand_hash[brand]["number_of_products"] + 1
  brand_hash[brand]["total_price"] = brand_hash[brand]["total_price"] + toy["full-price"].to_f
  brand_hash[brand]["total_sales"] = (brand_hash[brand]["total_sales"] + total_sales_amount).round(2)
end

puts " _                         _     "
puts "| |                       | |    "
puts "| |__  _ __ __ _ _ __   __| |___ "
puts "| '_ \\| '__/ _` | '_ \\ / _` / __|"
puts "| |_) | | | (_| | | | | (_| \\__ \\"
puts "|_.__/|_|  \\__,_|_| |_|\\__,_|___/"
puts

# For each brand in the data set:
brand_hash.each do |key, value|
  
  # Print the name of the brand
  puts key
  puts "**********************************"

  # Count and print the number of the brand's toys we stock
  puts "Number of Products: #{value["stock"]}"

  # Calculate and print the average price of the brand's toys
  average_product_price = (value["total_price"] / value["number_of_products"]).round(2)
  puts "Average Product Price: $#{average_product_price}"

  # Calculate and print the total revenue of all the brand's toy sales combined
  puts "Total Sales: $#{value["total_sales"]}"
  puts "**********************************"
  puts
end