import 'package:flutter/material.dart';
import 'package:gamezone/src/authify/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  final Color _primaryColor = Color.fromRGBO(125, 191, 211, 1.0);

  late double screenHeight;
  late double screenWidth;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(
          begin: 0.0,
          end: 1.1,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 40,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 1.1,
          end: 0.9,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 30,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 0.9,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.easeOutBack)),
        weight: 30,
      ),
    ]).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _primaryColor,
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AvatarWidget(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              animation: _scaleAnimation,
            ),
            SizedBox(height: screenHeight * 0.05),
            EmailFieldWidget(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
            ),
            SizedBox(height: screenHeight * 0.05),
            PasswordFieldWidget(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
            ),
            SizedBox(height: screenHeight * 0.05),
            LoginButtonWidget(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
            ),
          ],
        ),
      ),
    );
  }
}

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
              return FadeTransition(
                opacity: animation,
                child: child,
              );
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
