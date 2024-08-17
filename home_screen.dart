import 'package:flutter/material.dart';
import 'gardens_screens/garden1_screen.dart';
import 'gardens_screens/garden2_screen.dart';
import 'gardens_screens/garden3_screen.dart';
import 'gardens_screens/garden4_screen.dart';
import 'gardens_screens/garden5_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentGarden = 1;
  List<String> gardenNames = [
    "Garden 1",
    "Garden 2",
    "Garden 3",
    "Garden 4",
    "Garden 5"
  ];

  void _onGardenChange(int index) {
    setState(() {
      _currentGarden = index + 1;
    });
  }

  void _onGardenNameChange(String name, int index) {
    setState(() {
      gardenNames[index] = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gardening App'),
        backgroundColor: Colors.green[700],
        actions: [
          DropdownButton<int>(
            value: _currentGarden,
            onChanged: (int? value) {
              if (value != null) {
                _onGardenChange(value - 1);
              }
            },
            items: List.generate(
              gardenNames.length,
                  (index) => DropdownMenuItem(
                value: index + 1,
                child: Text(gardenNames[index]),
              ),
            ),
          ),
        ],
      ),
      body: _buildGardenScreen(),
    );
  }

  Widget _buildGardenScreen() {
    switch (_currentGarden) {
      case 1:
        return Garden1Screen(
          onNameChange: (name) => _onGardenNameChange(name, 0),
          gardenName: gardenNames[0],
        );
      case 2:
        return Garden2Screen(
          onNameChange: (name) => _onGardenNameChange(name, 1),
          gardenName: gardenNames[1],
        );
      case 3:
        return Garden3Screen(
          onNameChange: (name) => _onGardenNameChange(name, 2),
          gardenName: gardenNames[2],
        );
      case 4:
        return Garden4Screen(
          onNameChange: (name) => _onGardenNameChange(name, 3),
          gardenName: gardenNames[3],
        );
      case 5:
        return Garden5Screen(
          onNameChange: (name) => _onGardenNameChange(name, 4),
          gardenName: gardenNames[4],
        );
      default:
        return Garden1Screen(
          onNameChange: (name) => _onGardenNameChange(name, 0),
          gardenName: gardenNames[0],
        );
    }
  }
}
