# Recipe App — Laboratory Exercise 2 (Flutter)

This is a Flutter application created as part of Laboratory Exercise 2.  
The app uses **TheMealDB API** to display categories, meals, detailed recipes,  
and random daily recipes.

##  Features

###  Categories Screen
- Displays a list of all meal categories  
- Each category shows:
  - Name
  - Image
  - Description
- Search bar for filtering categories
- Tap on a category → navigates to meals list

###  Meals by Category
- Grid layout of meals
- Meal card: image + name
- Search meals using API  
  `https://www.themealdb.com/api/json/v1/1/search.php?s={query}`

### Meal Details Screen
- Full recipe:
  - Image  
  - Name  
  - Instructions  
  - Ingredients  
  - YouTube link (if available)
- Loaded using:  
  `https://www.themealdb.com/api/json/v1/1/lookup.php?i={id}`

### Random Recipe of the Day
- Shuffle icon in AppBar
- Displays a random recipe using:  
  `https://www.themealdb.com/api/json/v1/1/random.php`

### Code Structure (Required by the assignment)
lib/
├── models/
├── services/
├── screens/
├── widgets/
└── main.dart


## Screenshots

Below are screenshots of the working application.

### Categories Screen
![Categories](/lib/screenshots/sl1.png)

### Meals Screen
![Meals](/lib/screenshots/sl2.png)

### Meal Details
![Details](/lib/screenshots/sl3.png)

![Details](/lib/screenshots/sl4.png)

![Details](/lib/screenshots/sl5.png)

![Details](/lib/screenshots/sl6.png)
