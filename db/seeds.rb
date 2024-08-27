# db/seeds.rb
categories = Category.create([
                               { name: 'Engine Parts' },
                               { name: 'Electrical Parts' },
                               { name: 'Suspension' }
                             ])

goods = Good.create([
                      { name: 'Engine Oil', description: 'High quality engine oil', price: 29.99, weight: 1.5, category: categories[0] },
                      { name: 'Spark Plug', description: 'Durable spark plug', price: 12.99, weight: 0.2, category: categories[0] },
                      { name: 'Car Battery', description: 'Reliable car battery', price: 89.99, weight: 5.0, category: categories[1] },
                      { name: 'Shock Absorber', description: 'Comfortable ride with this shock absorber', price: 49.99, weight: 3.0, category: categories[2] }
                    ])
