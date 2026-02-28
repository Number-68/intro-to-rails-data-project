require 'net/http' 
require 'json'
require 'faker'

# makeup products types parse.
product_types = ["blush", "foundation", "eyebrow"]


# creating products and categories.
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



# creating customers
92.times do 
    Customer.create!( 
        first_name: Faker::Name.first_name, 
        last_name: Faker::Name.last_name, 
        phone_number: Faker::PhoneNumber.cell_phone, 
        email: Faker::Internet.unique.email 
        )
end




# creating purchases and lineitmes
123.times do

    # pick random customer
    customer = Customer.all.sample


    # create random purchase for customer
    purchase = Purchase.create!(
        customer: customer, 
        date: Faker::Date.backward(days: 180),
        total_price: 0
    )

    # random purchases up to 10
    rand(1..10).times do

        #random product and quantity
        product = Product.all.sample
        quantity = rand(1..15)

        LineItem.create!(
            purchase: purchase,
            product: product,
            quantity: quantity

        )


        # calculate purchase total

        purchase.total_price += product.price.to_f * quantity
    end

    # save!
    purchase.save! 
end









