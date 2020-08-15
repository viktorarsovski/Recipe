FactoryBot.define do
  factory :recipe do
    user

    title { 'Red Velvet Strawberry Cake' }
    description { 'I made this strawberry cake'}

    factory :directions do
      step { 'Whisk 3 cups flour, cocoa powder, baking soda, and salt together in a bowl.' }
    end

    factory :ingredient do
      name { '3 cups all-purpose flour' }
    end
  end
end
