# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.destroy_all
Product.destroy_all

cat1 = Category.create! name: "Necklace"
cat2 = Category.create! name: "Bracelet"
cat3 = Category.create! name: "Earring"
cat4 = Category.create! name: "Clearance"

# Neclaces
Product.create! title: "Necklace1", category_id: cat1.id, image: "necklace1.jpg", price: 15, list_price: 15, available: true, on_sale: false
Product.create! title: "Necklace2", category_id: cat1.id, image: "necklace2.jpg", price: 20, list_price: 20, available: true, on_sale: false
Product.create! title: "Necklace3", category_id: cat1.id, image: "necklace3.jpg", price: 25, list_price: 25, available: true, on_sale: false
Product.create! title: "Necklace4", category_id: cat1.id, image: "necklace4.jpg", price: 30, list_price: 30, available: true, on_sale: false
Product.create! title: "Necklace5", category_id: cat4.id, image: "necklace5.jpg", price: 35, list_price: 15, available: true, on_sale: true

#Earrings
Product.create! title: "Earring1", category_id: cat3.id, image: "earring1.jpg", price: 15, list_price: 15, available: true, on_sale: false
Product.create! title: "Earring2", category_id: cat3.id, image: "earring2.jpg", price: 20, list_price: 20, available: true, on_sale: false
Product.create! title: "Earring3", category_id: cat3.id, image: "earring3.jpg", price: 25, list_price: 25, available: true, on_sale: false
Product.create! title: "Earring4", category_id: cat3.id, image: "earring4.jpg", price: 30, list_price: 30, available: true, on_sale: false
Product.create! title: "Earring5", category_id: cat4.id, image: "earring5.jpg", price: 35, list_price: 15, available: true, on_sale: true

#Bracelets
Product.create! title: "Bracelet1", category_id: cat2.id, image: "bracelet1.jpg", price: 15, list_price: 15, available: true, on_sale: false
Product.create! title: "Bracelet2", category_id: cat2.id, image: "bracelet2.jpg", price: 20, list_price: 20, available: true, on_sale: false
Product.create! title: "Bracelet3", category_id: cat2.id, image: "bracelet3.jpg", price: 25, list_price: 25, available: true, on_sale: false
Product.create! title: "Bracelet4", category_id: cat2.id, image: "bracelet4.jpg", price: 30, list_price: 30, available: true, on_sale: false
Product.create! title: "Bracelet5", category_id: cat4.id, image: "bracelet5.jpg", price: 35, list_price: 15, available: true, on_sale: true
