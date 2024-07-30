User.create!(email: "admin@gmail.com",password: "123456",password_confirmation: "123456", admin: true)
30.times do |n|
  email = "example-#{n+1}@railstutorial.org" 
  password = "password"
  User.create!(email: email,password: password,password_confirmation: password)
end


10.times do |n|
  name = "Category-#{n+1}" 
  description = "Description-#{n+1}"
  ProductCategory.create!(name: name, description: description)
end

30.times do |n|
  name = "Product-#{n+1}"
  description = "This is a details desc"
  price = rand(20..30) + 0.5
  quantity = rand(20..30)
  user_id = 1
  product_category_id = rand(1..9)
  Product.create!(name: name, description: description, price: price, quantity: quantity, user_id: user_id, product_category_id: product_category_id)
end

4.times do |n|
  payment_type = %w(cod visa)
  user_id = n > 1 ? 2 : 3
  UserPayment.create!(user_id: user_id, payment_type: n%2 == 0 ? payment_type[0] : payment_type[1])
end

2.times do |n|
  user_id = n + 2
  address_detail = "User Adddess #{n+1}"
  phone = "8032402340#{n+1}"

  UserAddress.create!(user_id: user_id, address_detail: address_detail, phone: phone)
end

4.times do |n|
  user_id = n + 2
  total = 46 + rand(1..10)
  payment_type = %w(cod visa).sample

  Order.create!(user_id: user_id, total: total, payment_type: payment_type)
end

OrderItem.create(order_id: 1, product_id: 13, quantity:2)
OrderItem.create(order_id: 1, product_id: 5, quantity:1)
OrderItem.create(order_id: 2, product_id: 11, quantity:4)
OrderItem.create(order_id: 2, product_id: 21, quantity:1)
OrderItem.create(order_id: 3, product_id: 9, quantity:1)
OrderItem.create(order_id: 3, product_id: 2, quantity:2)
OrderItem.create(order_id: 4, product_id: 22, quantity:1)
OrderItem.create(order_id: 4, product_id: 12, quantity:6)

