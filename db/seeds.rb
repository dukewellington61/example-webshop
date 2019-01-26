Order.create!([
  {user_id: 1, product_id: 24, total: 10.0},
  {user_id: 1, product_id: 25, total: 5.0}
])
Product.create!([
  {name: "generic looking bike 1", description: "a rather generic looking bike", image_url: "adventure-beach-bicycle-462036.jpg", colour: "black", price: "450.99"},
  {name: "generic looking bike 2", description: "another rather generic looking bike", image_url: "mikkel-bech-748940-unsplash.jpg", colour: "black white", price: "499.99"},
  {name: "generic looking bike 3", description: "yet another generic looking bike", image_url: "race_bike.png", colour: "black white grey", price: "549.99"},
  {name: "generic looking bike 4", description: "that's right! another generic looking bike.", image_url: "race_bike.png", colour: "black white", price: "949.99"}
])
