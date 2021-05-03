puts '🌱 Seeding plants...'

Plant.create!([
  {
    name: 'Aloe',
    image: './images/aloe.jpg',
    price: 15.99,
    is_in_stock: true
  },
  {
    name: 'ZZ Plant',
    image: './images/zz-plant.jpg',
    price: 25.98,
    is_in_stock: true
  },
  {
    name: 'Pilea peperomioides',
    image: './images/pilea.jpg',
    price: 5.99,
    is_in_stock: true
  },
  {
    name: 'Pothos',
    image: './images/pothos.jpg',
    price: 12.11,
    is_in_stock: true
  },
  {
    id: 5,
    name: 'Jade',
    image: './images/jade.jpg',
    price: 10.37,
    is_in_stock: true
  },
  {
    name: 'Monstera Deliciosa',
    image: './images/monstera.jpg',
    price: 25.99,
    is_in_stock: true
  },
  {
    name: 'Fiddle Leaf Fig',
    image: './images/fiddle-leaf-fig.jpg',
    price: 55,
    is_in_stock: true
  }
])

puts '✅ Done seeding!'
