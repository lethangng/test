import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class Test4Screen extends StatelessWidget {
  const Test4Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: const Color(0xFF000000),
        style: TabStyle.fixed,
        color: const Color(0xFFC1C1CD),
        activeColor: const Color(0xFFFFFFFF),
        height: 60,
        curveSize: 100,
        top: -20,
        items: const [
          TabItem(
              icon: ZoomTapAnimation(
                child: Icon(
                  Icons.home,
                  weight: 30,
                  color: Colors.red,
                ),
              ),
              title: 'Home'),
          TabItem(icon: Icons.map, title: 'Discovery'),
          TabItem(
            isIconBlend: true,
            title: 'Home',
            icon: ZoomTapAnimation(
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.add,
                    weight: 30,
                    color: Colors.red,
                  ),
                  // SizedBox(height: 20),
                  // Text('Home'),
                ],
              ),
            ),
          ),
          TabItem(icon: Icons.message, title: 'Message'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        onTap: (int i) => print('click index=$i'),
      ),
    );
  }
}
