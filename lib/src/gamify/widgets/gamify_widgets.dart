
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../data/data.dart';

class FeatureGameWidget extends StatelessWidget {
  final Function(int) onPageChanged;
  final double screenHeight;
  final double screenWidth;

  const FeatureGameWidget({
    super.key,
    required this.onPageChanged,
    required this.screenHeight,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.50,
      width: screenWidth,
      child: PageView(
        allowImplicitScrolling: true,
        onPageChanged: onPageChanged,
        scrollDirection: Axis.horizontal,
        children:
        featuredGames.map((game) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                onError: (exception, stackTrace) {
                  if (kDebugMode) {
                    print("Error: $exception");
                  }
                },
                fit: BoxFit.cover,
                image: NetworkImage(game.coverImage.url),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class GradientContainer extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;

  const GradientContainer({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: screenHeight * 0.7,
        width: screenWidth,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromRGBO(35, 45, 59, 1.0), Colors.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: [0.65, 1.0],
          ),
        ),
      ),
    );
  }
}

class TopLayerWidget extends StatelessWidget {
  final int selectedIndex;
  final double screenHeight;
  final double screenWidth;

  const TopLayerWidget({
    super.key,
    required this.selectedIndex,
    required this.screenHeight,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05,
        vertical: screenWidth * 0.10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const TopBarWidget(),
          FeaturedGameInfoWidget(
            selectedIndex: selectedIndex,
            screenHeight: screenHeight,
            screenWidth: screenWidth,
          ),
          SizedBox(height: 10), // spacing
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ScrollableGamesWidget(
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                    topPadding: screenHeight * 0.08,
                    dataProvider: games,
                  ),
                  HorizontalImageWidget(
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                  ),
                  ScrollableGamesWidget(
                    screenHeight: screenHeight,
                    topPadding: screenHeight * 0.04,
                    screenWidth: screenWidth,
                    dataProvider: featuredGames,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.menu, color: Colors.blueGrey),
        Row(
          children: [
            Icon(Icons.notifications_outlined, color: Colors.blueGrey),
            const SizedBox(width: 10.0),
            Icon(Icons.search, color: Colors.blueGrey),
          ],
        ),
      ],
    );
  }
}

class FeaturedGameInfoWidget extends StatelessWidget {
  final int selectedIndex;
  final double screenHeight;
  final double screenWidth;

  const FeaturedGameInfoWidget({
    super.key,
    required this.selectedIndex,
    required this.screenHeight,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.37,
      width: screenWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            featuredGames[selectedIndex].title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: screenHeight * 0.040,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:
            featuredGames.map((game) {
              bool isActive =
                  game.title == featuredGames[selectedIndex].title;
              return Container(
                margin: EdgeInsets.only(right: 10.0, top: 25.0),
                height: (screenHeight * 0.004) * 2,
                width: (screenHeight * 0.004) * 2,
                decoration: BoxDecoration(
                  color: isActive ? Colors.amber : Colors.grey,
                  shape: BoxShape.circle,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class ScrollableGamesWidget extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;
  final double topPadding;
  final List dataProvider;

  const ScrollableGamesWidget({
    super.key,
    required this.screenHeight,
    required this.screenWidth, required this.topPadding, required this.dataProvider,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dataProvider.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: screenHeight * 0.15,
                width: screenWidth * 0.30,
                margin: EdgeInsets.only(right: 10.0, top: topPadding),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(dataProvider[index].coverImage.url),
                  ),
                ),
              ),
              SizedBox(
                width: screenWidth * 0.30,
                child: Text(
                  dataProvider[index].title,
                  maxLines: 3,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class HorizontalImageWidget extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;
  const HorizontalImageWidget({super.key, required this.screenHeight, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.12,
      width: screenWidth,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(featuredGames[2].coverImage.url),
        ),
      ),
    );
  }
}