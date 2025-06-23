import 'package:flutter/material.dart';
import 'package:gamezone/src/authify/pages/login_page.dart';

class LogoutButtonWidget extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;

  const LogoutButtonWidget({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        side: BorderSide(width: 2.0, color: Color.fromRGBO(125, 191, 211, 1.0)),
        backgroundColor: Colors.white,
        minimumSize: Size(screenWidth * 0.70, screenHeight * 0.05),
      ),
      onPressed: () {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 500),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              return FadeTransition(opacity: animation, child: child);
            },
            pageBuilder: (context, animation, secondaryAnimation) {
              return LoginPage();
            },
          ),
        );
      },
      child: Text(
        "LOGOUT",
        style: TextStyle(
          fontSize: 16.0,
          color: Color.fromRGBO(125, 191, 211, 1.0),
          letterSpacing: 1.0,
        ),
      ),
    );
  }
}
