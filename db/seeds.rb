Product.create!([
  {name: "generic looking bike 1", description: "a rather generic looking bike", image_url: "http://localhost:3000/assets/race_bike-dba5e269cf248f71fa3a156c148ab193ce1dc4fd031ea91c00a8cd129ab3681d.png"},
  {name: "generic looking bike 2", description: "another rather generic looking bike", image_url: "http://localhost:3000/assets/race_bike-dba5e269cf248f71fa3a156c148ab193ce1dc4fd031ea91c00a8cd129ab3681d.png"},
  {name: "generic looking bike 3", description: "yet another generic looking bike", image_url: "http://localhost:3000/assets/race_bike-dba5e269cf248f71fa3a156c148ab193ce1dc4fd031ea91c00a8cd129ab3681d.png"},
  {name: "generic looking bike 4", description: "that's right! another generic looking bike.", image_url: "http://localhost:3000/assets/race_bike-dba5e269cf248f71fa3a156c148ab193ce1dc4fd031ea91c00a8cd129ab3681d.png"}
])

Product.create(name: "seed-generated product", description: "I also created this product without using the HTML form!")