# # db/seeds.rb

# vespa_models = [
#   {
#     model: "GTS Super 300",
#     description: "Powerful and stylish scooter with advanced features.",
#     photo: Rails.root.join('db/seed-images/temp.png').open,
#     duration: 7,
#     finance_fee: 150.0,
#     purchase_fee: 4000.0,
#     amount_payable: 6700.0
#   },
#   {
#     model: "Primavera 150",
#     description: "Classic and elegant scooter for a smooth ride.",
#     photo: Rails.root.join('db/seed-images/temp.png').open,
#     duration: 5,
#     finance_fee: 120.0,
#     purchase_fee: 3500.0,
#     amount_payable: 5800.0
#   },
#   {
#     model: "Sprint 150",
#     description: "Sporty and nimble scooter with a touch of retro design.",
#     photo: Rails.root.join('db/seed-images/temp.png').open,
#     duration: 6,
#     finance_fee: 130.0,
#     purchase_fee: 3800.0,
#     amount_payable: 6200.0
#   },
#   {
#     model: "GTS Touring 300",
#     description: "Comfortable touring scooter for long-distance rides.",
#     photo: Rails.root.join('db/seed-images/temp.png').open,
#     duration: 10,
#     finance_fee: 180.0,
#     purchase_fee: 4500.0,
#     amount_payable: 7300.0
#   }
# ]

first_user = User.create(username: 'user1', email: 'user1@mail.com', password: '123456')
second_user = User.create(username: 'user2', email: 'user2@mail.com', password: '123456')

# vespa_models.each_with_index do |vespa, index|
#   if index % 2 == 0
#     first_user.motorcycles.create!(vespa)
#   else
#     second_user.motorcycles.create!(vespa)
#   end
# end
