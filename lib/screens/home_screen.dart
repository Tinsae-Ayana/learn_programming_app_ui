import 'package:educational_app_ui/screens/course_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<String> catName = const [
    'Catagory',
    'Classes',
    'Free Course',
    'BookStore',
    'Live course',
    'LeaderBoard'
  ];
  final List<Color> catColors = const [
    Color(0xffffcf2f),
    Color(0xff6fE08D),
    Color(0xff61BDFD),
    Color(0xfffc7c7f),
    Color(0xffcb84fb),
    Color(0xff78e667),
  ];

  final List<Icon> catIcons = const [
    Icon(Icons.category, color: Colors.white, size: 30),
    Icon(Icons.video_library, color: Colors.white, size: 30),
    Icon(Icons.assessment, color: Colors.white, size: 30),
    Icon(Icons.store, color: Colors.white, size: 30),
    Icon(Icons.play_circle_fill, color: Colors.white, size: 30),
    Icon(Icons.emoji_events, color: Colors.white, size: 30),
  ];

  final List<String> images = const [
    'assets/images/Flutter.png',
    'assets/images/Python.png',
    'assets/images/React Native.png',
    'assets/images/C#.png'
  ];

  final List<String> nameOfCourse = const [
    'Flutter',
    'Python',
    'React Native',
    'C#'
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _topSection(height, width),
          _buildOption(width, height),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Courses',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Text(
                  'See All',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color(0xFF674AEF)),
                )
              ],
            ),
          ),
          _builtCourseTile(height)
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: const Color(0xFF674AEF),
          unselectedItemColor: Colors.grey,
          onTap: (value) {},
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.assessment), label: 'Courses'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'WishList'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account')
          ]),
    );
  }

  Container _topSection(double height, double width) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      height: height * 0.3,
      decoration: const BoxDecoration(
          color: Color(0xFF674AEF),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(Icons.dashboard, color: Colors.white, size: 30),
                Icon(Icons.notifications, color: Colors.white, size: 30)
              ],
            ),
            SizedBox(height: height * 0.023),
            const Text('Hi, Programmer',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                    color: Colors.white)),
            SizedBox(height: height * 0.023),
            Container(
              alignment: Alignment.center,
              height: height * 0.08,
              width: width * 0.9,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                onChanged: (value) {},
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search here',
                    prefixIcon: Icon(Icons.search)),
              ),
            )
          ],
        ),
      ),
    );
  }

  GridView _buildOption(double width, double height) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 1.1),
      itemCount: catName.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 2),
              height: width * 0.15,
              width: width * 0.15,
              decoration: BoxDecoration(
                  color: catColors[index], shape: BoxShape.circle),
              child: catIcons[index],
            ),
            SizedBox(height: height * 0.02),
            Text(
              catName[index],
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(0.6)),
            )
          ],
        );
      },
    );
  }

  Expanded _builtCourseTile(double height) {
    return Expanded(
      child: GridView.builder(
          physics: const ScrollPhysics(),
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 15,
              childAspectRatio: 0.8),
          itemCount: nameOfCourse.length,
          itemBuilder: ((context, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: ((context) {
                  return const CourseScreen();
                })));
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFF674AEF).withOpacity(0.1)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      images[index],
                      width: 60,
                      height: 60,
                    ),
                    SizedBox(height: height * 0.02),
                    Text(
                      nameOfCourse[index],
                      style: const TextStyle(fontSize: 17),
                    ),
                    SizedBox(height: height * 0.02),
                    const Text('55 vidoes')
                  ],
                ),
              ),
            );
          })),
    );
  }
}
