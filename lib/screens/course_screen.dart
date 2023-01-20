import 'package:flutter/material.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  bool isVidoeSection = true;
  List<String> courseName = [
    'Introduction to Flutter',
    'Installing Flutter on Windows',
    'Setup emulator on Window',
    'Creating Our First App'
  ];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _videoCard(height),
            SizedBox(height: height * 0.025),
            const Text(
              'Fluttter Complete Course',
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(height: height * 0.015),
            const Text(
              'Created by Dear Programmer',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            SizedBox(height: height * 0.015),
            const Text(
              '55 Vidoes',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
            ),
            SizedBox(height: height * 0.025),
            _builtSectionButton(height, width),
            isVidoeSection
                ? Expanded(child: _vidoeSection(height))
                : Expanded(child: _descriptionSection(height))
          ],
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      leading: InkWell(
        onTap: (() {
          Navigator.of(context).pop(context);
        }),
        child: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
      title: const Text('Flutter',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 15.0),
          child: Icon(
            Icons.notifications,
            color: Color(0xFF674AEF),
            size: 30,
          ),
        )
      ],
    );
  }

  LimitedBox _videoCard(double height) {
    return LimitedBox(
      maxHeight: height * 0.3,
      child: Stack(
        children: [
          Container(
            height: height * 0.3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                    image: AssetImage('assets/images/Flutter.png')),
                color: const Color(0xFF674AEF).withOpacity(0.2)),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
              child: const Icon(
                Icons.play_arrow_rounded,
                color: Color(0xFF674AEF),
                size: 35,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _builtSectionButton(double height, double width) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
      height: height * 0.12,
      decoration: BoxDecoration(
          color: const Color(0xFF674AEF).withOpacity(0.2),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isVidoeSection = true;
              });
            },
            child: Container(
              width: width * 0.38,
              height: height * 0.12 * 0.7,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: isVidoeSection
                      ? const Color(0xFF674AEF)
                      : const Color(0xFF674AEF).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10)),
              child: const Text('Vidoes',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 17)),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                isVidoeSection = false;
              });
            },
            child: Container(
              alignment: Alignment.center,
              height: height * 0.12 * 0.7,
              width: width * 0.38,
              decoration: BoxDecoration(
                  color: !isVidoeSection
                      ? const Color(0xFF674AEF)
                      : const Color(0xFF674AEF).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10)),
              child: const Text('Description',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 17)),
            ),
          )
        ],
      ),
    );
  }

  Widget _vidoeSection(height) {
    return ListView.builder(
        itemCount: courseName.length,
        itemBuilder: ((context, index) {
          return ListTile(
            leading: Container(
              height: 45,
              width: 45,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xFF674AEF)),
              child: const Icon(
                Icons.play_arrow_rounded,
                color: Colors.white,
                size: 35,
              ),
            ),
            title: Text(
              courseName[index],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text('20 min  50 sec'),
          );
        }));
  }

  Widget _descriptionSection(height) {
    return ListView(
      padding: const EdgeInsets.only(top: 20),
      children: [
        const Text(
          'Lorem lpusm is simply dummy test of printing and texttyping industry, Lorem lpsum has been the industrys. it has beeen staandard text for the industry.',
          textAlign: TextAlign.justify,
        ),
        SizedBox(height: height * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Course Length:',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
            Row(
              children: const [
                Icon(
                  Icons.timer,
                  color: Color(0xFF674AEF),
                ),
                Text('26 hours',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18))
              ],
            )
          ],
        ),
        Row(
          children: const [
            Text('Rating:',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
            Icon(Icons.star, color: Colors.amber),
            Text('4.5',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
          ],
        )
      ],
    );
  }
}
