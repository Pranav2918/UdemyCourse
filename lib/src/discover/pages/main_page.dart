import 'package:flutter/material.dart';

import '../data/data.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late double screenHeight;
  late double screenWidth;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(Icons.menu, color: Colors.black),
        actions: [Icon(Icons.search, color: Colors.black)],
        backgroundColor: Colors.white,
        title: Image.asset("assets/images/logo_discover.png"),
        centerTitle: true,
      ),
      body: ListOfPlaces(screenHeight: screenHeight, screenWidth: screenWidth),
    );
  }
}

class ListOfPlaces extends StatefulWidget {
  final double screenHeight;
  final double screenWidth;

  const ListOfPlaces({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  @override
  State<ListOfPlaces> createState() => _ListOfPlacesState();
}

class _ListOfPlacesState extends State<ListOfPlaces> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Container(
              height: widget.screenHeight * 0.35,
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(articles[index].image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: widget.screenWidth * 0.06,
                        backgroundColor: Colors.blueAccent,
                      ),
                      SizedBox(width: widget.screenWidth * 0.02),
                      Text(
                        articles[index].author,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: widget.screenWidth * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50.0),
                  Center(
                    child: Text(
                      articles[index].title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: widget.screenWidth * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 270.0,
              left: widget.screenWidth * 0.10,
              child: Container(
                height: widget.screenHeight * 0.08,
                width: widget.screenWidth * 0.80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                  border: Border.all(color: Colors.orangeAccent),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          articles[index].isLiked = !articles[index].isLiked;
                          setState(() {});
                        },
                        child: Row(
                          children: [
                            Icon(
                              articles[index].isLiked
                                  ? Icons.favorite
                                  : Icons.favorite_outline,
                              color: Colors.redAccent,
                            ),
                            SizedBox(width: widget.screenWidth * 0.02),

                            Text(
                              articles[index].likes.toString(),
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: widget.screenWidth * 0.04,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.message, color: Colors.blueGrey),
                          SizedBox(width: widget.screenWidth * 0.02),
                          Text(
                            articles[index].comments.toString(),
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: widget.screenWidth * 0.04,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.share, color: Colors.blueGrey),
                          SizedBox(width: widget.screenWidth * 0.02),
                          Text(
                            articles[index].shares.toString(),
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: widget.screenWidth * 0.04,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
