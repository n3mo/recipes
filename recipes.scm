;;; This file contains an sexp-based recipe database. The entire
;;; database is written as a list, with one recipe per list
;;; entry. Each recipe, in turn, is an alist containing the follow
;;; keys:
;;; 
;;;     title
;;;     cat (category)
;;;     ing (ingredients)
;;;     preptime
;;;     baketime
;;;     baketemp
;;;     portion
;;;     calories
;;;     prep
;;;     hint

(define recipes 
'(
  ;; Recipe
  (("title" . "Spicy Asian White Bean Dip")
   ("cat" . "Appetizers")
   ("preptime" . "10 minutes")
   ("baketime" . "")
   ("baketemp" . "")
   ("portion" . "3-4")
   ("calories" . "")
   ("ing" . ((("title" . "")
	      ("ing" . (
			("1" "15oz can of white beans (rinsed)")
			("1 Tbs" "Olive oil")
			("1 tsp" "Sesame oil")
			("2 tsp" "Soy sauce (or to taste)")
			("2 Tbs" "Sriracha")
			("1" "Garlic clove")
			("1/2 tsp" "Curry powder")
			("1/4 cup" "Water")
			("1 Tbs" "Lime juice")
			("" "Crackers or fried crispy bread"))))))
   ("prep" . ("In food processor, combine all ingredient except for the crackers/bread. Blend until smooth."
	      "Serve with your favorite crackers or bread."))
   ("hint" . ("While blending the ingredients add more or less water to achieve the consistency you prefer.")))
  
  ;; Recipe
  (("title" . "Baked Falafel Sandwich with Jerusalem Salad")
   ("cat" . "Sandwiches")
   ("preptime" . "15 minutes")
   ("baketime" . "25 minutes")
   ("baketemp" . "375°F")
   ("portion" . "4")
   ("calories" . "")
   ("ing" . ((
	      ("title" . "Falafel")
	      ("ing" . (
			("1 can" "Chickpeas (drained)")
			("1/2 cup" "Red onion, chopped")
			("1/2 cup" "Cilantro, chopped")
			("1 Tbs" "Ground flax meal")
			("3 Tbs" "Water")
			("2 cloves" "Garlic (small)")
			("1 Tbs" "Flour")
			("1 tsp" "Cumin")
			("1/2 Tbs" "Sea salt"))))
	     (
	      ("title" . "Jerusalem Salad")
	      ("ing" . (
			("2 Tbs" "Tahini")
			("5 Tbs" "Water")
			("1/2" "Lime, juiced")
			("1/4 tsp" "Sea salt (or to taste)")
			("1/2" "Medium cucumber, diced")
			("2" "Tomatoes"))))))
    ("prep" . ("Preheat oven to 375°."
	       "Combine 1 tablespoon of flax meal with 3 tablespoons of water. Allow mixture to soak while you are preparing ingredients for the next step."
	       "Place the chickpeas in a food processor and coarsely chop on low. Add the flax mixture, onion, cilantro, and other herbs and seasonings and pulse into a coarse mixture. Do not over-blend!"
	       "Shape mixture into 1-inch think patties and bake at 375° for about 25 minutes, or until crispy."
	       "While your falafel is baking, prepare the Jerusalem salad. Mix together Tahini, water, lime juice, and salt. Add mixture to cucumber and tomatoes. Add more tahini, lime juice, and water as needed."
	       "Assemble sandwich: Open the pita shell and add two to three falafels along one side. Fill the other side with Jerusalem salad. Enjoy!"))
    ("hint" . ("")))

  ;; Recipe
  (("title" . "Vegan Nut Loaf")
   ("cat" . "Nut and lentil based")
   ("preptime" . "30 minutes")
   ("baketime" . "60 minutes")
   ("baketemp" . "375°F")
   ("portion" . "6")
   ("calories" . "")
   ("ing" . ((("title" . "")
	      ("ing" . (
			("2 cups" "Nuts, mix of choice")
			("1" "Onion, chopped")
			("3" "Garlic cloves, pressed")
			("6 oz" "Mushrooms, finely chopped")
			("3 Tbs" "Flat-leaf parsley, chopped")
			("2 Tbs" "Fresh herbs (sage, rosemary, thyme")
			("1 1/2 cups" "Brown rice")
			("4 Tbs" "Flax meal, ground")
			("12 Tbs" "Water")
			("1 tsp" "Salt")
			("1/2 tsp" "Pepper")
			("" "Olive oil"))))))
    ("prep" . ("If you don't have leftover cooked rice on hand, cook the brown rice according to the package instructions. Preheat the oven to 375°F"
	       "Mix up flax and water and allow mixture to sit to form gelatinous, egg-like consistency. Or lightly beat eggs if using"
	       "Place nuts on baking sheet and toast for about 8-10 minutes, until lightly browned (or roast stove top). Allow to cool and then finely chop with knife or in food processor."
	       "Heat olive oil in pan and saute the onion and garlic until translucent. Add the mushrooms and herbs (not parsley). Cook about 5 minutes, until the mushrooms are golden. Transfer to a large bowl."
	       "In the large bowl, combine the onion/mushroom mixture with the toasted/chopped nuts. Add parsely, 1 1/2 cups cooked rice, flax mixture (or eggs), 1 teaspoon salt, and 1/2 teaspoon freshly ground pepper. (Add more salt to taste.)"
	       "Oil a 9-inch loaf pan, line bottom with parchment paper, and oil it again. Pour the mixture from the large bowl into the pan. Bake about 1 hour until golden brown. Let cool in pan for 20 minutes and then invert loaf and remove from pan. Serve warm."))
    ("hint" . ("Our mixture of nuts were 3/4 cup cashews, 1/2 cup pecans, 1/2 cup Brazil, and 1/4 hazelnuts. Walnuts would be another great addition!"
	       "Most vegetarian versions use cheese, so use if desired.")))

  ;; Recipe
  (("title" . "Vegan Spicy Creamy Kale Pasta")
   ("cat" . "Pastas")
   ("preptime" . "45 minutes")
   ("baketime" . "")
   ("baketemp" . "")
   ("portion" . "4")
   ("calories" . "")
   ("ing" . ((("title" . "")
	      ("ing" . (
			("15 oz" "Penne pasta")
			("1 1/2 cups" "Cashews")
			("1" "Onion, chopped")
			("1" "Bunch of kale")
			("2 Tbs" "Nutritional yeast")
			("1/2 cup" "Non-dairy milk (unsweetened)")
			("1 tsp" "Paprika")
			("1-2 tsp" "Chile powder")
			("1 tsp" "Red pepper flakes")
			("1-2" "Garlic cloves, pressed")
			("Dash" "Salt")
			("" "Olive oil"))))))
   ("prep" . ("Cook pasta according to package directions."
	      "In a large pan, warm a few tablespoons of olive oil. Toss in kale and saut\'{e} until kale has cooked down completely."
	      "In a blender, add cashews, nutritional yeast, spices, and milk. Blend until you have a creamy consistency, adding more milk or water if too thick."
	      "Drain pasta. Add cooked kale mixture to pasta pot and toss with cream sauce. Sprinkle with a dash of chile powder for some color!"))
   ("hint" . ("Optionally leave hint blank")))

  ;; Recipe
  (("title" . "Split Pea Soup")
   ("cat" . "Soups")
   ("preptime" . "45 minutes")
   ("baketime" . "")
   ("baketemp" . "")
   ("portion" . "6+")
   ("calories" . "")
   ("ing" . ((("title" . "")
	      ("ing" . (
			("3" "Celery ribs")
			("3" "Carrots, diced")
			("1" "Onion, large")
			("1 lb" "Dried split peas")
			("3" "Potatoes (large), diced")
			("3" "Garlic cloves, minced")
			("1 tsp" "Marjoram")
			("1 tsp" "Bay leaves (cut)")
			("1 tsp" "Salt")
			("1/2 tsp" "Pepper")
			("2" "14oz cans vegetable broth")
			("2 1/2" "14oz cans water")
			("3-4 cups" "Collard greens, chopped"))))))
   ("prep" . ("In a large stock pot over medium-high heat, saut\'{e} celery, carrots, and onion in about 1.5 Tbs olive oil for about 5 minutes."
	      "Add split peas and saut\'{e} a bit longer."
	      "Add potatoes and saut\'{e} a bit longer."
	      "Add all spices, broth, and water."
	      "Bring to a boil then reduce heat to low and simmer covered for about 25-30 minutes, or until split peas become tender."
	      "Add collard greens and simmer for about 10 minutes longer, or until greens are tender. Add additional salt and pepper to taste."))
   ("hint" . ("Use a single whole bay leaf instead of cut bay leaves. You can then remove the leaf after the soup is prepared. This helps to avoid the hard texture of bay leaves, which never soften well.")))

  ;; Recipe
  (("title" . "Energy Bites")
   ("cat" . "Snacks")
   ("preptime" . "5 minutes")
   ("baketime" . "")
   ("baketemp" . "")
   ("portion" . "3-4")
   ("calories" . "")
   ("ing" . ((("title" . "")
	      ("ing" . (
			("1/2 cup" "Creamy almond butter")
			("1/6 cup" "Honey")
			("1 cup" "Coconut flakes")
			("1/4 cup" "Ground flax meal")
			("1 tsp" "Vanilla")
			("3/4 cup" "Dark chocolate chunks"))))))
   ("prep" . ("In medium bowl, mix all ingredients together with a spoon until well blended. Chill in the fridge for 30 minutes. Roll into small balls. Store in an airtight container (in the fridge) for up to one week."))
   ("hint" . ("")))

  ;; Recipe
  (("title" . "Quinoa with Roasted Brussels Sprouts")
   ("cat" . "One-bowl")
   ("preptime" . "30 minutes")
   ("baketime" . "")
   ("baketemp" . "")
   ("portion" . "5-6")
   ("calories" . "")
   ("ing" . ((("title" . "Quinoa")
	      ("ing" . (
			("1 1/2 cups" "Quinoa")
			("3 cups" "Water")
			("1/2 tsp" "Salt (or to taste)"))))
	     (("title" . "Brussels Sprouts Mix")
	      ("ing" . (
			("1" "Red onion, chopped")
			("1 bag" "Brussels sprouts (24oz), halved (or quartered)")
			("4 Tbs" "Olive oil (or butter subst)")
			("3-4 Tbs" "Balsamic vinegar")
			("" "Sea salt, to taste")
			("1-2" "Garlic cloves, minced")
			("2 tsp" "Dried dill"))))
	     (("title" . "Topping")
	      ("ing" . (
			("2 Tbs" "Fresh Italian parsley, chopped")
			("1/4" "Roasted almonds")
			("" "Sea salt, to taste")
			("" "Black pepper, to taste"))))))
   ("prep" . ("Add the quinoa and water to a pot and season with sea salt, to taste. Cover, bring to a boil, and cook the quinoa on low until the water is absorbed and the quinoa can be fluffed with a fork (about 15 minutes)."
	      "Saute the Brussels and onion using olive oil and/or butter substitute. Add in seasoning: salt, pepper, garlic, and dill. Add balsamic towards the end of cook time."
	      "Then add in the fluffed quinoa. Season to taste, adding in more oil, butter substitute, balsamic, or salt to taste. Top with parsley and almonds."))
   ("hint" . ("")))

  ;; Recipe
  (("title" . "Asian Cucumber Thai Salad")
   ("cat" . "Salads")
   ("preptime" . "20 minutes")
   ("baketime" . "")
   ("baketemp" . "")
   ("portion" . "4")
   ("calories" . "")
   ("ing" . ((("title" . "")
	      ("ing" . (
			("1/3 cup" "White vinegar")
			("1/3 cup" "White sugar")
			("1/2 tsp" "Ground coriander")
			("1/2 tsp" "Red pepper flakes")
			("1/2 tsp" "Salt")
			("2 lbs" "Cucumber, halved, seeded, and sliced")
			("1 Tbs" "Fish sauce")
			("1/2 cup" "Red onion, finely chopped")
			("2" "Roma tomatoes, chopped")
			("2 Tbs" "Fresh cilantro, chopped")
			("1 Tbs" "Fresh mint, chopped")
			("1/4 cup" "Roasted peanuts, chopped")
			("" "Fresh mint sprigs (optional)"))))))
   ("prep" . ("Whisk together the vinegar, sugar, coriander, red pepper flakes, and salt in a salad bowl until the sugar is dissolved. Stir in the cucumbers, onion, tomatoes, cilantro, and chopped mint, and toss with dressing. Cover and refridgerate for 1 hour to blend the flavors."
	      "Before serving, toss again with chopped peanuts, and garnish with sprigs of fresh mint"))
   ("hint" . ("")))

  ;; Recipe
  (("title" . "Roasted Cauliflower Salad")
   ("cat" . "Salads")
   ("preptime" . "30 minutes")
   ("baketime" . "15")
   ("baketemp" . "400°F")
   ("portion" . "5-6")
   ("calories" . "")
   ("ing" . ((("title" . "Salad")
	      ("ing" . (
			("1" "Head of cauliflower")
			("3/4" "Red bell pepper")
			("1/2" "Onion, sliced")
			("" "Italian flat leaf parsley")
			("" "Kalamata or green olives")
			("" "Olive oil"))))
	     (("title" . "Dressing")
	      ("ing" . (
			("2-3 Tbs" "Olive oil")
			("1 Tbs" "Red wine vinegar (+ to taste)")
			("Touch" "Dijon mustard")
			("1" "Garlic clove, pressed")
			("Pinch" "Salt"))))))
   ("prep" . ("Chop cauliflower into small/medium pieces. Toss cauliflower and onion in about 1 Tbs of olive oil. Spread out in a metal pan and sprinkle kosher salt over top. Divide bell pepper into 3 sections, and lay sections in pan, skin side up. Roast at 400° until cauliflower is soft but al dente and browned on edges (Takes about 15 minutes. Follow up by broiling for a few minutes, but watch that mix doesn't burn.) "
	      "Meanwhile, slice/dice kalamata or green olives. Finely chop parsley. Mix up dressing ingredients."
	      "Once veggies are done roasting, remove from oven. Peel skin off bell pepper sections and chop into thin slices. Combine cauliflower, bell pepper, and onion. Add olives and parsley. Pour dressing over top and toss. Add salt and more red wine vinegar to taste."))
   ("hint" . ("")))

  ))
