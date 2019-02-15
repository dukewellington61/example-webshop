User.create!([
  {first_name: "Arthur ", last_name: "Wellesley", email: "dukewellington@gmx.de", encrypted_password: "$2a$11$INHxnwlVcvnuGLOcWB4qRuOyf.cx8qmpn7Jprv35h4Uu5mRP8BRRS", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, admin: true},
  {first_name: "aas", last_name: "AA", email: "johndoe@randomuser.com", encrypted_password: "$2a$11$SwmCPRPB3cCqh.aYPWsCleTTl8.IMR7oC8gk609Zq/B31rjgJz8vW", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, admin: false},
  {first_name: "a", last_name: "a", email: "test.user@test.de", encrypted_password: "$2a$11$dXaGYix.Lf58ZORXOSarzenvkmAvzuJ88C.N1BUB9ZnY9MLBIGMAG", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, admin: false},
  {first_name: "drg", last_name: "dfg", email: "andreas@admin.de", encrypted_password: "$2a$11$njY4lPtnaIFRirY2S5PlRuD8uxROajgipFV0DfnVfy2cvNkZAtuJC", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, admin: false}
])
Comment.create!([
  {user_id: 1, body: "nice", rating: 4, product_id: 1},
  {user_id: 1, body: "What a great bike! ", rating: 5, product_id: 1},
  {user_id: 1, body: "This bike sucks!!", rating: 0, product_id: 1},
  {user_id: 1, body: "This Bicycle is bike is an absolutely wonderful piece of machinery. Marvelous! Spectacular!", rating: 5, product_id: 1},
  {user_id: 1, body: "This thing is way to fast. Not my cup of coffee.", rating: 2, product_id: 4},
  {user_id: 1, body: "This Bike is the shit! Yeah!", rating: 5, product_id: 4},
  {user_id: 1, body: "what a shit bike. I am so angry with it. grrrrrrrrrrrrrr!", rating: 1, product_id: 4},
  {user_id: 1, body: "Faster than lightning! I'm liking it!!!", rating: 5, product_id: 3},
  {user_id: 1, body: "It doesn't even have pedals.", rating: nil, product_id: 3},
  {user_id: nil, body: "fuckyou", rating: 1, product_id: 1}
])
Order.create!([
  {user_id: 1, product_id: 1, total: 10.0},
  {user_id: 1, product_id: 3, total: 5.0}
])
Product.create!([
  {name: "Mountain Challenger", description: "Sleek yet Robust - Perfect for high speed downhill rides of the breakneck variety!", image_url: "adventure-beach-bicycle-462036.jpg", colour: "black", price: "949.95"},
  {name: "Elegant Racer", description: "Rapid and Stylish - Perfect for covering long distances at high velocity!", image_url: "mikkel-bech-748940-unsplash.jpg", colour: "black white", price: "1499.99"},
  {name: "Single Speed Beauty", description: "Quick and Graceful - Perfect for riding around town in style. Discover the Hipster in you!", image_url: "robert-bye-200735-unsplash.jpg", colour: "white", price: "949.99"},
  {name: "Old Time Standard", description: "Unique and Daring - Perfect for the proper aspirer with a vintage kind of taste. ", image_url: "wheel-3184641_1920.jpg", colour: "black", price: "2499.95"},
  {name: "test bike", description: "", image_url: "", colour: "", price: nil}
])
