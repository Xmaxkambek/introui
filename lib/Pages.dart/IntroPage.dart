import 'package:flutter/material.dart';
import 'package:pdpui3/Pages.dart/HomePage.dart';
import 'package:pdpui3/unitls/Strings.dart';

class IntroPage extends StatefulWidget {
  static final String id = 'introPage';
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  PageController? _pagecontroller;
  int currentIndex = 0;
  void initState() {
    _pagecontroller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pagecontroller!.dispose();
    super.dispose();
  }

  bool g = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView(
              onPageChanged: ((int page) {
                currentIndex = page;
                setState(() {});
              }),
              controller: _pagecontroller,
              children: [
                makePage(
                    image: 'img/image1.png',
                    title: Strings.stepOneTitle,
                    content: Strings.stepOneContent),
                makePage(
                    image: 'img/image2.png',
                    title: Strings.stepTwoTitle,
                    content: Strings.stepTwoContent),
                makePage(
                    image: 'img/image3.png',
                    title: Strings.stepThreeTitle,
                    content: Strings.stepTwoContent)
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildIndictor(),
              ),
            ),
            currentIndex == 2
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 50, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, HomePage.id);
                          },
                          child: const Text(
                            'Skip',
                            style: TextStyle(color: Colors.red, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  )
                : const Text(''),
          ],
        ),
      ),
    );
  }

  Widget makePage({image, title, content}) {
    return Container(
      padding: const EdgeInsets.only(left: 50, right: 50, bottom: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Image.asset(image),
              ),
              Text(title,
                  style: const TextStyle(color: Colors.red, fontSize: 30)),
              const SizedBox(height: 20),
              Text(
                content,
                style: const TextStyle(color: Colors.grey, fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _indictor(bool isActive) {
    return AnimatedContainer(
      height: isActive ? 10 : 6,
      width: isActive ? 20 : 6,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(5),
      ),
      duration: const Duration(milliseconds: 300),
    );
  }

  List<Widget> _buildIndictor() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indictor(true));
      } else {
        indicators.add(_indictor(false));
      }
    }
    return indicators;
  }
}
  // GestureDetector(
  //           onTap: () {
  //             Navigator.pushReplacementNamed(context, HomePage.id);
  //           },
  //           child: const Padding(
  //             padding: EdgeInsets.only(right: 20, left: 20, top: 10),
  //             child: Text(
  //               'Skip',
  //               style: TextStyle(color: Colors.green, fontSize: 18),
  //             ),
  //           ),
  //         ),