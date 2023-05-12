import 'package:batman_project/batman/batman_button.dart';
import 'package:batman_project/batman/batman_city.dart';
import 'package:batman_project/batman/singup.dart';
import 'package:flutter/material.dart';

const _backgroundColor = Color(0xFF100F0B);
const _batmanBackground = 'assets/images/batman_background.png';
const _batmanAlone = 'assets/images/batman_alone.png';
const _batmanLogo = 'assets/images/batman_logo.png';

class HomeBatman extends StatefulWidget {
  const HomeBatman({super.key});

  @override
  State<HomeBatman> createState() => _HomeBatmanState();
}

class _HomeBatmanState extends State<HomeBatman> with TickerProviderStateMixin {
  late AnimationController controllerStart;
  late Animation<double> startLogoAnimation;
  late Animation<double> batmanAnimation;
  late Animation<double> topLogoAnimation;
  late Animation<double> opacityTextAnimation;
  late Animation<double> buttomAnimation;
  late Animation<double> opacityButtomAnimation;

  late AnimationController controllerSingUp;
  late Animation<double> batmanDownAnimationSingUp;
  late Animation<double> batmanUpAnimationSingUp;
  late Animation<double> opacityAnimationSingUp;
  late Animation<double> cityAnimationSingUp;
  late Animation<double> optionAnimationSingUp;
  late Animation<double> opacityOptionAnimationSingUp;

  void _controllerStart() {
    controllerStart =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));

    startLogoAnimation = Tween(begin: 50.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controllerStart,
        curve: const Interval(0, 0.3),
      ),
    );

    topLogoAnimation = Tween(begin: 0.0, end: -44.0).animate(
      CurvedAnimation(
        parent: controllerStart,
        curve: const Interval(0.4, 0.55),
      ),
    );
    opacityTextAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controllerStart,
        curve: const Interval(0.4, 0.55),
      ),
    );
    batmanAnimation = Tween(begin: 6.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controllerStart,
        curve: const Interval(0.55, 1.0),
      ),
    );
    buttomAnimation = Tween(begin: 100.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controllerStart,
        curve: const Interval(0.55, 1.0),
      ),
    );
    opacityButtomAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controllerStart,
        curve: const Interval(0.6, 1.0),
      ),
    );
  }

  void _controllerSingUp() {
    controllerSingUp = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    batmanDownAnimationSingUp = Tween(begin: 0.0, end: 50.0).animate(
        CurvedAnimation(
            parent: controllerSingUp, curve: const Interval(0, 0.3)));
    opacityAnimationSingUp = Tween(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(
            parent: controllerSingUp, curve: const Interval(0, 0.3)));
    batmanUpAnimationSingUp = Tween(begin: 0.0, end: -50.0).animate(
        CurvedAnimation(
            parent: controllerSingUp, curve: const Interval(0.35, 0.5)));
    cityAnimationSingUp = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controllerSingUp, curve: const Interval(0.5, 0.6)));

    optionAnimationSingUp =
        Tween(begin: 0.0, end: -MediaQuery.of(context).size.height * 0.42)
            .animate(CurvedAnimation(
                parent: controllerSingUp, curve: const Interval(0.6, 1)));
    opacityOptionAnimationSingUp = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controllerSingUp, curve: const Interval(0.6, 1)));
  }

  @override
  void didChangeDependencies() {
    _controllerSingUp();
    super.didChangeDependencies();
  }

  void onTapSingUp() {
    controllerSingUp.forward();
  }

  @override
  void initState() {
    _controllerStart();

    controllerStart.forward();
    super.initState();
  }

  @override
  void dispose() {
    controllerStart.dispose();
    controllerSingUp.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: size.height * 0.4,
            child: Image.asset(
              _batmanBackground,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            height: size.height * 0.6,
            child: AnimatedBuilder(
              animation: controllerStart,
              builder: (context, child) {
                return Transform.scale(
                  scale: batmanAnimation.value,
                  child: child,
                );
              },
              child: AnimatedBuilder(
                animation: controllerSingUp,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0.0, batmanUpAnimationSingUp.value),
                    child: Transform.translate(
                      offset: Offset(0.0, batmanDownAnimationSingUp.value),
                      child: Image.asset(
                        _batmanAlone,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.45,
            right: 0,
            left: 0,
            height: size.height / 2,
            child: AnimatedBuilder(
                animation: controllerSingUp,
                builder: (context, child) {
                  return Opacity(
                    opacity: opacityAnimationSingUp.value,
                    child: Transform.translate(
                      offset: Offset(0, batmanDownAnimationSingUp.value),
                      child: Column(
                        children: [
                          AnimatedBuilder(
                            animation: controllerStart,
                            builder: (context, child) {
                              return Opacity(
                                opacity: opacityTextAnimation.value,
                                child: child,
                              );
                            },
                            child: Column(
                              children: const [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'WELCOM TO',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'GOTHAN CITY',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          AnimatedBuilder(
                            animation: controllerStart,
                            builder: (context, child) {
                              return Opacity(
                                opacity: opacityButtomAnimation.value,
                                child: Transform.translate(
                                  offset: Offset(0.0, buttomAnimation.value),
                                  child: child,
                                ),
                              );
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  BatmanButton(
                                    title: 'LOGIN',
                                    onTap: () {},
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  BatmanButton(
                                    title: 'SING UP',
                                    onTap: onTapSingUp,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          Positioned(
            top: size.height * 0.4,
            left: 0,
            right: 0,
            height: 50,
            child: AnimatedBuilder(
              animation: controllerStart,
              builder: (context, child) {
                return Transform.scale(
                  scale: startLogoAnimation.value,
                  child: child,
                );
              },
              child: AnimatedBuilder(
                animation: controllerStart,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, topLogoAnimation.value),
                    child: AnimatedBuilder(
                        animation: controllerSingUp,
                        builder: (context, child) {
                          return Opacity(
                            opacity: opacityAnimationSingUp.value,
                            child: Image.asset(
                              _batmanLogo,
                            ),
                          );
                        }),
                  );
                },
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.3,
            left: 0,
            right: 0,
            height: size.height * 0.24,
            child: AnimatedBuilder(
              animation: controllerSingUp,
              builder: (context, child) {
                return BatmanCity(
                  animation: cityAnimationSingUp,
                );
              },
            ),
          ),
          Positioned(
            top: size.height,
            right: 0,
            left: 0,
            child: AnimatedBuilder(
                animation: controllerSingUp,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0.0, optionAnimationSingUp.value),
                    child: Opacity(
                      opacity: opacityOptionAnimationSingUp.value,
                      child: const SingUp(),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
