import 'package:flutter/material.dart';
import 'package:memos/core/extentions/textextention.dart';

class custom_splash extends StatefulWidget {
  const custom_splash({super.key});

  @override
  State<custom_splash> createState() => _custom_splashState();
}

class _custom_splashState extends State<custom_splash> {
  @override
  void initState() {
    super.initState();
   Future.delayed(const Duration(seconds: 3),() {
      Navigator.pushReplacementNamed(context, 'home');
    },);
  }
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      bottomNavigationBar:  Text(
        textAlign: TextAlign.center,
        'devolped by zyad abdelhamed',
        style: context.tStyle.textTheme.displaySmall
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder(
              curve: Curves.bounceIn,
              duration: const Duration(seconds: 1),
              tween: Tween(begin: 0.0, end: 0.8),
              builder: (context, value, child) => Transform.scale(
                scale: value,
                child: Image.asset(
                  'assets/1.jpg',
                  width: MediaQuery.of(context).size.width * 2 / 3,
                  height: MediaQuery.of(context).size.height * 1 / 4,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            TweenAnimationBuilder(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: const Duration(milliseconds:30 ),
              builder: (context, value, child) => AnimatedOpacity(
                opacity: value,
                duration: const Duration(seconds: 2),
                child:  Text(
                  'دون ملاحظاتك',
                  style: context.tStyle.textTheme.bodyLarge
                )
              ),
            )
          ],
        ),
      ),
    );
  }}

 

