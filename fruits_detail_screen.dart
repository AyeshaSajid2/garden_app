import 'package:flutter/material.dart';
import 'hive_model.dart';

class FruitDetailScreen extends StatelessWidget {
  final Fruit fruit;

  const FruitDetailScreen({super.key, required this.fruit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(fruit.name),
        backgroundColor: Colors.green,
        elevation: 0,
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Display fruit image at the top of the screen
                Container(
                  height: constraints.maxHeight * 0.4,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(30.0),
                    ),
                    image: DecorationImage(
                      image: AssetImage(fruit.imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(30.0),
                    ),
                    child: Image.asset(
                      fruit.imagePath,
                      height: constraints.maxHeight * 0.4,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/images/default.png',
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),

                // Display description
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        fruit.description,
                        style: const TextStyle(
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24.0),

                // Display quick info heading
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Quick Info',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),

                // Display quick info cards
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        buildQuickInfoCard('Spacing', fruit.spacing.toString(), fruit.imagePath),
                        const SizedBox(width: 16.0),
                        buildQuickInfoCard('Sun', fruit.sun, 'assets/detail_images/sun.png'),
                        const SizedBox(width: 16.0),
                        buildQuickInfoCard('Water', fruit.water, 'assets/detail_images/pot.png'),
                        const SizedBox(width: 16.0),
                        buildQuickInfoCard('Season', fruit.season, 'assets/detail_images/temperature.png'),
                        const SizedBox(width: 16.0),
                        buildQuickInfoCard('Frost', fruit.frost, 'assets/detail_images/frost.png'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24.0),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildQuickInfoCard(String title, String value, String imagePath) {
    return Container(
      width: 140, // Adjust width to fit content
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Display title
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8.0),

          // Display image
          Image.asset(
            imagePath,
            height: 40, // Adjust the size of the images
            width: 40,
          ),
          const SizedBox(height: 8.0),

          // Display the value
          Text(
            value,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
