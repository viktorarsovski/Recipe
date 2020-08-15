User.create([
  {
    name: 'Viktor Arsovski',
    email: 'macedonian.wow@live.com',
    password: 'viktor12345',
    password_confirmation: 'viktor12345',
    created_at: '15.08.2020'
  },
  {
    name: 'Simona Arsovska',
    email: 'simona@simona.com',
    password: 'simona12345',
    password_confirmation: 'simona12345',
    created_at: '15.08.2020'
  },
  {
    name: 'Vera Arsovska',
    email: 'vera@live.com',
    password: 'vera12345',
    password_confirmation: 'vera12345',
    created_at: '15.08.2020'
  }
])

Recipe.create([
  {
    user_id: User.second.id,
    title: 'Red Velvet Strawberry Cake',
    description: 'I made this strawberry cake for my friends surprise birthday party.',
    created_at: '15.08.2020'
  }
])

Ingredient.create([
  {
    recipe_id: Recipe.last.id,
    name: '3 cups all-purpose flour'
  },
  {
    recipe_id: Recipe.last.id,
    name: '1 ½ tablespoons unsweetened cocoa powder'
  },
  {
    recipe_id: Recipe.last.id,
    name: '1 teaspoon baking soda'
  },
  {
    recipe_id: Recipe.last.id,
    name: '½ teaspoon salt'
  },
  {
    recipe_id: Recipe.last.id,
    name: '½ cup unsalted butter, softened'
  },
  {
    recipe_id: Recipe.last.id,
    name: '1 ½ cups white sugar'
  },
  {
    recipe_id: Recipe.last.id,
    name: '1 cup vegetable oil'
  },
  {
    recipe_id: Recipe.last.id,
    name: '4 large eggs eggs, separated'
  }
])

Direction.create([
  {
    recipe_id: Recipe.last.id,
    step: 'Preheat the oven to 350 degrees F (175 degrees C).'
  },
  {
    recipe_id: Recipe.last.id,
    step: 'Whisk 3 cups flour, cocoa powder, baking soda, and salt together'
  },
  {
    recipe_id: Recipe.last.id,
    step: 'Beat 1/2 cup butter in a bowl using an electric mixer until creamy'
  },
  {
    recipe_id: Recipe.last.id,
    step: 'Beat in egg yolks, vanilla extract, vinegar, and enough food'
  },
  {
    recipe_id: Recipe.last.id,
    step: 'Beat egg whites until thick and frothy in a separate bowl'
  },
  {
    recipe_id: Recipe.last.id,
    step: 'Bake in the preheated oven until a toothpick inserted into the center'
  }
])

Recipe.create([
  {
    user_id: User.first.id,
    title: 'Tater Tot Taco Casserole',
    description: 'Just what the grandkids ordered. Tater tots, Mexican food',
    created_at: '15.08.2020'
  }
])

Ingredient.create([
  {
    recipe_id: Recipe.last.id,
    name: '1 pound ground beef'
  },
  {
    recipe_id: Recipe.last.id,
    name: '1 small onion, diced'
  },
  {
    recipe_id: Recipe.last.id,
    name: '1 clove garlic, minced'
  },
  {
    recipe_id: Recipe.last.id,
    name: '1 (1 ounce) packet taco seasoning mix'
  },
  {
    recipe_id: Recipe.last.id,
    name: '1 (16 ounce) bag frozen Mexican-style corn'
  },
  {
    recipe_id: Recipe.last.id,
    name: '1 (12 ounce) can black beans, rinsed and drained'
  },
  {
    recipe_id: Recipe.last.id,
    name: '1 (12 ounce) bag shredded Mexican cheese blend'
  },
  {
    recipe_id: Recipe.last.id,
    name: '1 (16 ounce) package frozen tater tots'
  }
])

Direction.create([
  {
    recipe_id: Recipe.last.id,
    step: 'Preheat an oven to 375 degrees F (190 degrees C). Prepare a 9x13-inch baking dish with cooking spray.'
  },
  {
    recipe_id: Recipe.last.id,
    step: 'Cook the ground beef in a skillet over medium heat until completely browned, 5 to 7 minutes.'
  },
  {
    recipe_id: Recipe.last.id,
    step: 'Combine the ground beef mixture in a large bowl with about 3/4 of the Mexican cheese'
  },
  {
    recipe_id: Recipe.last.id,
    step: 'Pour about 1/3 of the enchilada sauce into the bottom of the prepared baking dish.'
  },
  {
    recipe_id: Recipe.last.id,
    step: 'Bake in the preheated oven for 40 minutes.'
  }
])

Recipe.create([
  {
    user_id: User.last.id,
    title: 'Ice Cream Pizza',
    description: 'Devils food cake mix is transformed into a cookie crust',
    created_at: '15.08.2020'
  }
])

Ingredient.create([
  {
    recipe_id: Recipe.last.id,
    name: '½ (15.25 ounce) package devils food cake mix'
  },
  {
    recipe_id: Recipe.last.id,
    name: '¼ cup vegetable oil'
  },
  {
    recipe_id: Recipe.last.id,
    name: '1 egg'
  },
  {
    recipe_id: Recipe.last.id,
    name: '1½ cup semi-sweet chocolate chips'
  },
  {
    recipe_id: Recipe.last.id,
    name: '1 pinch flaked salt'
  },
  {
    recipe_id: Recipe.last.id,
    name: '1 quart vanilla ice cream'
  },
  {
    recipe_id: Recipe.last.id,
    name: '½ cup chopped walnuts, or more to taste'
  },
  {
    recipe_id: Recipe.last.id,
    name: '⅓ cup hot fudge, or more to taste'
  }
])

Direction.create([
  {
    recipe_id: Recipe.last.id,
    step: 'Preheat oven to 350 degrees F (175 degrees C).'
  },
  {
    recipe_id: Recipe.last.id,
    step: 'Combine cake mix, vegetable oil, and egg in a large bowl until well.'
  },
  {
    recipe_id: Recipe.last.id,
    step: 'Bake in the preheated oven until cookie crust is set, 14 to 16 minutes'
  },
  {
    recipe_id: Recipe.last.id,
    step: 'Soften ice cream at room temperature for 20 minutes'
  },
  {
    recipe_id: Recipe.last.id,
    step: 'Spread beaten ice cream over cooled cookie crust with an offset spatula'
  },
  {
    recipe_id: Recipe.last.id,
    step: 'Slice ice cream "pizza" into 6 to 8 slices and top each slice'
  }
])
