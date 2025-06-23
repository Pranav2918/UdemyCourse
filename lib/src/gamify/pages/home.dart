import 'package:flutter/material.dart';
import '../widgets/gamify_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  late double screenHeight;
  late double screenWidth;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
  }

  void onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FeatureGameWidget(
            onPageChanged: onPageChanged,
            screenHeight: screenHeight,
            screenWidth: screenWidth,
          ),
          GradientContainer(
            screenHeight: screenHeight,
            screenWidth: screenWidth,
          ),
          TopLayerWidget(
            selectedIndex: _selectedIndex,
            screenHeight: screenHeight,
            screenWidth: screenWidth,
          ),
        ],
      ),
    );
  }
}

