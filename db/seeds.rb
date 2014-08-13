# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.destroy_all
Product.destroy_all
Order.destroy_all
OrderProduct.destroy_all

cat1 = Category.create! name: "Necklace"
cat2 = Category.create! name: "Bracelet"
cat3 = Category.create! name: "Earring"

# Neclaces
p1 = Product.create! title: "Necklace1", category_id: cat1.id, image: "necklace1.jpg", price: 15, discount_percent: 15, available: true, on_sale: false
p2 = Product.create! title: "Necklace2", category_id: cat1.id, image: "necklace2.jpg", price: 20, available: true, on_sale: false
p3 = Product.create! title: "Necklace3", category_id: cat1.id, image: "necklace3.jpg", price: 25, available: true, on_sale: false
p4 = Product.create! title: "Necklace4", category_id: cat1.id, image: "necklace4.jpg", price: 30, available: true, on_sale: false
p5 = Product.create! title: "Necklace5", category_id: cat1.id, image: "necklace5.jpg", price: 35, available: true, on_sale: true

#Earrings
p6 = Product.create! title: "Earring1", category_id: cat3.id, image: "earring1.jpg", price: 15, available: true, on_sale: false
p7 = Product.create! title: "Earring2", category_id: cat3.id, image: "earring2.jpg", price: 20, available: true, on_sale: false
p8 = Product.create! title: "Earring3", category_id: cat3.id, image: "earring3.jpg", price: 25, available: true, on_sale: false
p9 = Product.create! title: "Earring4", category_id: cat3.id, image: "earring4.jpg", price: 30, available: true, on_sale: false
p10 = Product.create! title: "Earring5", category_id: cat3.id, image: "earring5.jpg", price: 35, available: true, on_sale: true

#Bracelets
p11 = Product.create! title: "Bracelet1", category_id: cat2.id, image: "bracelet1.jpg", price: 15, available: true, on_sale: false
p12 = Product.create! title: "Bracelet2", category_id: cat2.id, image: "bracelet2.jpg", price: 20, available: true, on_sale: false
p13 = Product.create! title: "Bracelet3", category_id: cat2.id, image: "bracelet3.jpg", price: 25, available: true, on_sale: false
p14 = Product.create! title: "Bracelet4", category_id: cat2.id, image: "bracelet4.jpg", price: 30, available: true, on_sale: false
p15 = Product.create! title: "Bracelet5", category_id: cat2.id, image: "bracelet5.jpg", price: 35, available: true, on_sale: true



#Orders - can be pending, paid, shipped, cancelled.
# o1 = Order.create! user_id: 1, order_status: "pending"
# o2 = Order.create! user_id: 1, order_status: "pending"
# o3 = Order.create! user_id: 1, order_status: "pending"
# o4 = Order.create! user_id: 1, order_status: "pending"
# Order.update o1.id, order_status: "shipped", shipment_date: Time.now
# Order.update o4.id, order_status: "paid"


#Order products
# op1 = OrderProduct.create! order_id: o1.id, product_id: p1.id, quantity: 1, price: p1.list_price
# op2 = OrderProduct.create! order_id: o1.id, product_id: p6.id, quantity: 2, price: p6.list_price
# op3 = OrderProduct.create! order_id: o1.id, product_id: p11.id, quantity: 1, price: p11.list_price
# op4 = OrderProduct.create! order_id: o2.id, product_id: p7.id, quantity: 3, price: p7.list_price
# op5 = OrderProduct.create! order_id: o3.id, product_id: p13.id, quantity: 4, price: p13.list_price
