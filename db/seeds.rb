require 'net/http' 
require 'json'


# makeup products types parse.
product_types = ["blush", "foundation", "eyebrow"]



product_types.each do |type|
    # fetch data

    url = URI("http://makeup-api.herokuapp.com/api/v1/products.json?product_type=#{type}") 
    response = Net::HTTP.get(url) 
    items = JSON.parse(response)

    # parse through data
    items.each do |item|

        # minimum price 1.00
        price = item["price"].to_f

        next if price < 1.0

        # create or reuse category
        category = Category.find_or_create_by!(
            product_category: item["product_type"]
        )


        # create the row
        Product.create!( 
            brand: item["brand"], 
            name: item["name"], 
            price: price, 
            category: category 
            )
    end
end


        