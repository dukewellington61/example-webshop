User.create!([
  {first_name: nil, last_name: nil, email: "dukewellington@gmx.de", encrypted_password: "$2a$11$INHxnwlVcvnuGLOcWB4qRuOyf.cx8qmpn7Jprv35h4Uu5mRP8BRRS", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil}
])
Order.create!([
  {user_id: 1, product_id: 1, total: 10.0},
  {user_id: 1, product_id: 3, total: 5.0}
])
Product.create!([
  {name: "generic looking bike 1", description: "a rather generic looking bike", image_url: "adventure-beach-bicycle-462036.jpg", colour: "black", price: "450.99"},
  {name: "generic looking bike 2", description: "another rather generic looking bike", image_url: "mikkel-bech-748940-unsplash.jpg", colour: "black white", price: "499.99"},
  {name: "generic looking bike 3", description: "yet another generic looking bike", image_url: "race_bike.png", colour: "black white grey", price: "549.99"},
  {name: "generic looking bike 4", description: "that's right! another generic looking bike.", image_url: "race_bike.png", colour: "black white", price: "949.99"},
  {name: "Vintage Bike", description: "old stuff", image_url: "bicycle-1296407_1280.png", colour: "black", price: "1000.0"},
  {name: "", description: "", image_url: "", colour: "", price: nil},
  {name: "", description: "", image_url: "", colour: "", price: nil},
  {name: "3453453", description: "", image_url: "", colour: "", price: nil},
  {name: nil, description: "", image_url: "", colour: "", price: nil},
  {name: "!§)$($)", description: "", image_url: "", colour: "", price: nil},
  {name: "I like chocolate", description: "sweet", image_url: "/home/euklid/carrerFoundry Web Dev Course/nameofapp/app/assets/images/race_bike.png", colour: "brown", price: "1.99"},
  {name: "Vintage Bike2", description: "weegweg", image_url: "/assets/images/race_bike.png", colour: "dfrhdh", price: "4.0"}
])
