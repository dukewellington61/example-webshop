User.create!([
  {first_name: nil, last_name: nil, email: "dukewellington@gmx.de", encrypted_password: "$2a$11$INHxnwlVcvnuGLOcWB4qRuOyf.cx8qmpn7Jprv35h4Uu5mRP8BRRS", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil},
  {first_name: nil, last_name: nil, email: "andreas_koeth@gmx.de", encrypted_password: "$2a$11$.BJNMRUBDEBiwR2sh9vRaO.tGmkr4bf1anOyP5pOHKblLnVUbh5t6", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil},
  {first_name: nil, last_name: nil, email: "johndoe@randomuser.com", encrypted_password: "$2a$11$XjzMme.ue0eNbeuIsKguHupxc6tOyasSO1eIrersbdhfQm//Nn8O6", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil}
])
Comment.create!([
  {user_id: 1, body: "bad", rating: 1, product_id: 1},
  {user_id: 1, body: "nice", rating: 4, product_id: 1},
  {user_id: 1, body: "meh", rating: 2, product_id: 1}
])
Order.create!([
  {user_id: 1, product_id: 1, total: 10.0},
  {user_id: 1, product_id: 3, total: 5.0}
])
Product.create!([
  {name: "Mountain Challenger", description: "Sleek yet Robust - Perfect for high speed downhill rides of the breakneck variety!", image_url: "adventure-beach-bicycle-462036.jpg", colour: "black", price: "949.95"},
  {name: "Elegant Racer", description: "Rapid and Stylish - Perfect for covering long distances at high velocity!", image_url: "mikkel-bech-748940-unsplash.jpg", colour: "black white", price: "1499.99"},
  {name: "Single Speed Beauty", description: "Quick and Graceful - Perfect for riding around town in style. Discover the Hipster in you!", image_url: "robert-bye-200735-unsplash.jpg", colour: "white", price: "949.99"},
  {name: "Old Time Standard", description: "Unique and Daring - Perfect for the proper aspirer with a vintage kind of taste. ", image_url: "wheel-3184641_1920.jpg", colour: "black", price: "2499.95"}
])
