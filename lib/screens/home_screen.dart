import 'package:flutter/material.dart';
import '../models/category.dart';
import '../models/Review.dart';  // Importer le modèle Review
import '../widgets/category_item.dart';
import './menu_screen.dart'; // Importer l'écran du menu

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List statique;
  late Key categoriesfinal;
  List<Category> staticCategories = [
    Category(idCategorie: 1, nomCategorie: "Pizza", imageUrl: "https://static.vecteezy.com/ti/photos-gratuite/t2/22994042-le-pepperoni-pizza-et-une-piece-de-etire-fromage-pizza-avec-ai-genere-gratuit-photo.jpg"),
    Category(idCategorie: 2, nomCategorie: "Burger", imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAevSJWXMqXGJcdMSMmHj2Op1rivg9c1Kehw&s"),
    Category(idCategorie: 3, nomCategorie: "Pasta", imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYY1GWo5E49WS6_LkfhH35Wc1Q8sLdVlhEcw&s"),
    Category(idCategorie: 4, nomCategorie: "Salad", imageUrl: "https://images.radio-canada.ca/v1/alimentation/recette/4x3/0002-salade-verte-vinaigrette-echalotes.jpg"),

  ];

  // Liste statique de critiques
  List<Review> staticReviews = [
    Review(title: "Great Pizza!", description: "Delicious crust and toppings.", rating: 4.5),
    Review(title: "Amazing Burger", description: "The burger was juicy and tasty.", rating: 4.8),
    Review(title: "Pasta Perfection", description: "Perfectly cooked and flavorful.", rating: 4.7),
    Review(title: "Fresh Salad", description: "Very fresh and healthy.", rating: 4.3),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chili's Tunisie"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Barre de recherche
            TextField(
              decoration: InputDecoration(
                hintText: "Search on Coody",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 16),

            // Bannière d'images de nourriture
            Container(
              height: 200,
              child: PageView(
                children: [
                  Image.asset('assets/images/im1.png', fit: BoxFit.cover),
                  Image.asset('assets/images/im2.png', fit: BoxFit.cover),
                  Image.asset('assets/images/im3.png', fit: BoxFit.cover),
                ],
              ),
            ),
            SizedBox(height: 16),

            // Section des catégories sous forme d'images horizontales
            Text(
              "Popular Categories", // Titre de la section
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Container(
              height: 120, // Hauteur des catégories
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: staticCategories.length,
                itemBuilder: (context, index) {
                  final category = staticCategories[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            category.imageUrl ?? 'https://via.placeholder.com/150', // Image de catégorie
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          category.nomCategorie ?? 'Unknown',
                          style: TextStyle(fontSize: 12), // Taille du texte
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),

            // Section principale des catégories (grille)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Category", // Titre de la grille
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MenuScreen()), // Page suivante
                    );
                  },
                  child: Text("See all"),
                ),
              ],
            ),
            SizedBox(height: 8),

            // Grille des catégories principales
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: staticCategories.length,
                itemBuilder: (context, index) {
                  return CategoryItem(category: staticCategories[index]);
                },
              ),
            ),

            // Section des critiques
            SizedBox(height: 16),
            Text(
              "Customer Reviews", // Titre des critiques
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),

            // Liste des critiques
            Expanded(
              child: ListView.builder(
                itemCount: staticReviews.length,
                itemBuilder: (context, index) {
                  final review = staticReviews[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(review.title),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(review.description),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellow),
                              SizedBox(width: 4),
                              Text(review.rating.toString()),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
