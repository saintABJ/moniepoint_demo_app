import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:moniepoint_demo_app/presentation/home_screen.dart';

class DetailScreen extends StatefulWidget {
  final int index;

  const DetailScreen({required this.index});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(59.9311, 30.3609);
  late Animation<double> _animation;
  final int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 13.0,
            ),
            mapType: MapType.normal,
          ),
          Positioned(
            top: 50.h,
            left: 20.w,
            right: 20.w,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: const Row(
                children: [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Saint Petersburg",
                      ),
                    ),
                  ),
                  Icon(Icons.filter_list, color: Colors.grey),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: const Row(
                children: [
                  Icon(Icons.list),
                  Text("List of variants"),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            left: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: const BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: const Icon(Icons.send),
            ),
          ),
          Positioned(
            bottom: 160,
            left: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: const Icon(Icons.stacked_bar_chart),
            ),
          ),
          Positioned(
              top: 250,
              right: 250,
              child: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 156, 17),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15))),
                child: const Icon(
                  Icons.build_circle,
                  color: Colors.white,
                ),
              )),
          Positioned(
              top: 280,
              right: 80,
              child: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 156, 17),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15))),
                child: const Icon(
                  Icons.build_circle,
                  color: Colors.white,
                ),
              )),
          Positioned(
              top: 360,
              right: 60,
              child: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 156, 17),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15))),
                child: const Icon(
                  Icons.build_circle,
                  color: Colors.white,
                ),
              )),
          Positioned(
              bottom: 300,
              left: 200,
              child: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 156, 17),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15))),
                child: const Icon(
                  Icons.build_circle,
                  color: Colors.white,
                ),
              )),
          Positioned(
              top: 320,
              right: 220,
              child: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 156, 17),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15))),
                child: const Icon(
                  Icons.build_circle,
                  color: Colors.white,
                ),
              )),
          Positioned(
              top: 580,
              right: 240,
              child: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 156, 17),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15))),
                child: const Icon(
                  Icons.build_circle,
                  color: Colors.white,
                ),
              )),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding:
                  const EdgeInsets.only(bottom: 0.0, right: 64.0, left: 64.0),
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _selectedIndex == 0
                                ? const Color.fromARGB(255, 255, 156, 17)
                                : Colors.black),
                        child: IconButton(
                          icon: const Icon(Icons.search_rounded,
                              color: Colors.white),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _selectedIndex == 1
                              ? const Color.fromARGB(255, 255, 156, 17)
                              : Colors.black),
                      child: IconButton(
                        icon: const Icon(Icons.message, color: Colors.white),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _selectedIndex == 2
                              ? const Color.fromARGB(255, 255, 156, 17)
                              : Colors.black),
                      child: IconButton(
                        icon: const Icon(Icons.home, color: Colors.white),
                        onPressed: () => Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration:
                                const Duration(milliseconds: 500),
                            pageBuilder: (_, __, ___) =>
                                HomeScreen(onAccepted: () {}),
                            transitionsBuilder: (_, animation, __, child) {
                              return FadeTransition(
                                  opacity: animation, child: child);
                            },
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _selectedIndex == 3
                              ? const Color.fromARGB(255, 255, 156, 17)
                              : Colors.black),
                      child: IconButton(
                        icon: const Icon(Icons.favorite, color: Colors.white),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _selectedIndex == 4
                              ? const Color.fromARGB(255, 255, 156, 17)
                              : Colors.black),
                      child: IconButton(
                        icon: const Icon(Icons.person, color: Colors.white),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
