FactoryBot.define do
  
  factory :item do
    name                 {Faker::Name.name}
    item_description     {Faker::Lorem.sentence}
    price                {"1000"}
    brand_id             {"1"}
    saler_id             {"1"}
    category_id          {"1"}
    shoes_size_id        {"1"}
    condition_id         {"1"}
    delivery_way_id      {"1"}
    delivery_burden_id   {"1"}
    prefecture_id        {"1"}
    shipment_days_id     {"1"}
    buyer_id             {"2"}
    clothes_size_id      {"1"}
  end
end
