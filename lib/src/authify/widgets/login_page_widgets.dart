import 'package:flutter/material.dart';
import 'package:gamezone/src/gamify/pages/home.dart';

class AvatarWidget extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;
  final Animation<double> animation;

  const AvatarWidget({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    double circleD = screenHeight * 0.25;

    return ScaleTransition(
      scale: animation,
      child: Container(
        height: circleD,
        width: circleD,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromRGBO(169, 224, 241, 1.0),
          image: DecorationImage(
            image: AssetImage("assets/images/main_avatar.png"),
          ),
        ),
      ),
    );
  }
}

class EmailFieldWidget extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;

  const EmailFieldWidget({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth * 0.70,
      child: TextFormField(
        cursorColor: Colors.white,
        autocorrect: false,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: "Enter your email",
          hintStyle: TextStyle(color: Colors.white),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class PasswordFieldWidget extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;

  const PasswordFieldWidget({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth * 0.70,
      child: TextFormField(
        cursorColor: Colors.white,
        autocorrect: false,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: "*******",
          hintStyle: TextStyle(color: Colors.white),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class LoginButtonWidget extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;

  const LoginButtonWidget({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        minimumSize: Size(screenWidth * 0.70, screenHeight * 0.05),
      ),
      onPressed: () {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            transitionDuration: Duration(seconds: 2),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              return FadeTransition(opacity: animation, child: child);
            },
            pageBuilder: (context, animation, secondaryAnimation) {
              return HomePage();
            },
          ),
        );
      },
      child: Text(
        "LOGIN",
        style: TextStyle(
          fontSize: 16.0,
          color: Color.fromRGBO(125, 191, 211, 1.0),
          letterSpacing: 1.0,
        ),
      ),
    );
  }
}
