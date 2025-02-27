import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moniepoint_demo_app/font/roboto_styles.dart';
import 'package:moniepoint_demo_app/widgets/bottomNav.dart';

import '../constants/app_colors.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback onAccepted;
  final bool autoSlide;

  const HomeScreen(
      {super.key, this.autoSlide = true, required this.onAccepted});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _navBarController;
  late Animation<double> _navBarAnimation;
  late AnimationController _sliderController;
  late Animation<double> _sliderAnimation;
  late Timer _timer;
  int _counter = 0;
  final double _maxDrag = 320.0;

  @override
  void initState() {
    super.initState();
    _startAutoIncrement();

    // Slider Animation Controller
    _sliderController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(reverse: true);
    _sliderAnimation =
        Tween<double>(begin: 0.0, end: _maxDrag).animate(CurvedAnimation(
          parent: _sliderController,
          curve: Curves.easeInOut,
        ));

    // BottomNavBar Animation Controller
    _navBarController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );
    _navBarAnimation =
        CurvedAnimation(parent: _navBarController, curve: Curves.easeOut);

    _navBarController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _timer.cancel();
      }
    });

    _sliderController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onAccepted();
      }
    });
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _sliderController.forward();
      _navBarController.forward();
      _startAutoIncrement();
    });
  }

  void _startAutoIncrement() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!_navBarController.isAnimating) {
        _timer.cancel();
      } else {
        setState(() {
          _counter++;
        });
      }
    });
  }

  @override
  void dispose() {
    _navBarController.dispose();
    _sliderController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [Color(0xffA5957E), Colors.white],
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 140,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.location_pin,
                                    color: AppColors.secColor,
                                  ),
                                  Text(
                                    'St Petersburg',
                                    style: AppStyleRoboto.kFontW3.copyWith(
                                        color: AppColors.secColor,
                                        fontSize: 15.spMin),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const CircleAvatar(
                            child: ClipOval(
                                child: Image(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'images/assets/ayodeji.png'))),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        'Hi, Marina',
                        style: AppStyleRoboto.kFontW5.copyWith(
                            color: AppColors.secColor, fontSize: 30.spMin),
                      ),
                      Text(
                        'Let\'s select your \nperfect place',
                        style: AppStyleRoboto.kFontW7.copyWith(
                            color: AppColors.textColor, fontSize: 40.spMin),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              width: 170.w,
                              height: 170.h,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.primaryColor,
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  const Text(
                                    'Buy',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  Text(
                                    '$_counter',
                                    style: AppStyleRoboto.kFontW7.copyWith(
                                        color: Colors.white,
                                        fontSize: 50.spMin),
                                  ),
                                  const Text('offers',
                                      style: TextStyle(color: Colors.white))
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              width: 170.w,
                              height: 170.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  const Text(
                                    'Rent',
                                    style: TextStyle(color: AppColors.secColor),
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  Text(
                                    '$_counter',
                                    style: AppStyleRoboto.kFontW7.copyWith(
                                        color: AppColors.secColor,
                                        fontSize: 50.spMin),
                                  ),
                                  const Text('offers',
                                      style:
                                          TextStyle(color: AppColors.secColor))
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        height: 150.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'images/assets/property_2.png',
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 150.h,
                              ),
                            ),
                            Positioned(
                              bottom: 10.h,
                              child: Container(
                                width: _maxDrag + 70.w,
                                height: 60.h,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFD8C6B5),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  "Gladkova St., 25",
                                  style: AppStyleRoboto.kFontW5.copyWith(
                                      color: Colors.black, fontSize: 20.spMin),
                                ),
                              ),
                            ),
                            AnimatedBuilder(
                              animation: _sliderAnimation,
                              builder: (context, child) {
                                return Positioned(
                                  left: _sliderAnimation.value,
                                  bottom: 10.h,
                                  child: Container(
                                    width: _maxDrag - 230,
                                    height: 60.h,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: const Icon(Icons.arrow_forward_ios),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 200.h,
                              width: 150.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  'images/assets/property_3.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.h,
                          ),
                          Column(
                            children: [
                              Container(
                                height: 100.h,
                                width: 200.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    'images/assets/property_4.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Container(
                                height: 100.h,
                                width: 200.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    'images/assets/property_2.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 100.h,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: AnimatedBuilder(
            animation: _navBarAnimation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, 50 * (1 - _navBarAnimation.value)),
                child: child,
              );
            },
            child: const BuildBottomNavBar(),
          ),
        )
      ]),
    );
  }
}
