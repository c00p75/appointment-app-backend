# db/seeds.rb

vespa_models = [
  {
    model: "GTS Super 300",
    description: "Powerful and stylish scooter with advanced features.",
    photo: "vespa_gts_super_300.jpg",
    duration: 7,
    finance_fee: 150.0,
    purchase_fee: 4000.0,
    amount_payable: 6700.0
  },
  {
    model: "Primavera 150",
    description: "Classic and elegant scooter for a smooth ride.",
    photo: "vespa_primavera_150.jpg",
    duration: 5,
    finance_fee: 120.0,
    purchase_fee: 3500.0,
    amount_payable: 5800.0
  },
  {
    model: "Sprint 150",
    description: "Sporty and nimble scooter with a touch of retro design.",
    photo: "vespa_sprint_150.jpg",
    duration: 6,
    finance_fee: 130.0,
    purchase_fee: 3800.0,
    amount_payable: 6200.0
  },
  {
    model: "GTS Touring 300",
    description: "Comfortable touring scooter for long-distance rides.",
    photo: "vespa_gts_touring_300.jpg",
    duration: 10,
    finance_fee: 180.0,
    purchase_fee: 4500.0,
    amount_payable: 7300.0
  }
]

vespa_models.each do |vespa|
  Motorcycle.create!(vespa)
end
