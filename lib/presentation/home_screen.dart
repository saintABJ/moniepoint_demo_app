import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:moniepoint_demo_app/presentation/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late AnimationController _controller;
  late Animation<double> _animation;
  late Timer _timer;
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _startAutoIncrement();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _startAutoIncrement() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _counter++;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            //  end: Alignment.bottomCenter,
            colors: [Color(0xffA5957E), Colors.white],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 140,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_pin,
                            color: Colors.grey,
                          ),
                          Text('St Petersburg',
                              style: TextStyle(color: Colors.grey))
                        ],
                      ),
                    ),
                  ),
                  const CircleAvatar(
                    backgroundColor: Colors.yellow,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Hi, Marina',
                style: TextStyle(color: Colors.grey.shade100, fontSize: 30),
              ),
              const Text(
                'Let\'s select your \nperfect place',
                style: TextStyle(color: Colors.black, fontSize: 40),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 170, // Adjust the size as needed
                    height: 170,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(
                          255, 255, 156, 17), // Change to your preferred color
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        "Circle",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 170, // Adjust the size as needed
                    height: 170,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Center(
                      child: Text(
                        '$_counter',
                        style: const TextStyle(
                          color: Color(0xffA5957E),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 150,
                width: double.infinity,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: const Image(
                    image: AssetImage('images/assets/property_1.png')),
              ),
              Expanded(
                child: Row(
                  children: [
                    Container(
                      height: double.infinity,
                      width: 100,
                      child: const Image(
                          image: AssetImage('images/assets/property_1.png')),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, 100 * (1 - _animation.value)),
            child: child,
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, -5),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.search_rounded,
                      color: _selectedIndex == 0
                          ? const Color.fromARGB(255, 255, 156, 17)
                          : Colors.white),
                  onPressed: () => _onItemTapped(0),
                ),
                IconButton(
                  icon: Icon(Icons.message,
                      color: _selectedIndex == 1
                          ? const Color.fromARGB(255, 255, 156, 17)
                          : Colors.white),
                  onPressed: () => _onItemTapped(1),
                ),
                IconButton(
                  icon: Icon(Icons.home,
                      color: _selectedIndex == 2
                          ? const Color.fromARGB(255, 255, 156, 17)
                          : Colors.white),
                  onPressed: () => _onItemTapped(2),
                ),
                Container(
                  child: IconButton(
                    icon: Icon(Icons.favorite,
                        color: _selectedIndex == 3
                            ? const Color.fromARGB(255, 255, 156, 17)
                            : Colors.white),
                    onPressed: () => _onItemTapped(3),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.person,
                      color: _selectedIndex == 4
                          ? const Color.fromARGB(255, 255, 156, 17)
                          : Colors.white),
                  onPressed: () => _onItemTapped(4),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
