import 'package:flutter/material.dart';

class ScreenTwo extends StatelessWidget {
  ScreenTwo({Key? key}) : super(key: key);

  List<String> title = [
    'All',
    'Bible In a Yeat',
    'Dailies',
    'Minutes',
    'Noven'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.search,
              size: 28,
              color: Colors.black,
            ),
          ),
        ],
        title: const Text(
          'Meditate',
          style: TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 19, vertical: 15),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color(0xFF039EA2),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      child: const Text(
                        'All',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                    ...title.map((element) {
                      return Container(
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: const Color(0xffE6FEFF),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        child: Text(
                          element,
                          style: const TextStyle(
                            color: Color(0xFF039EA2),
                            fontSize: 14,
                          ),
                        ),
                      );
                    })
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  cardTest(
                      'assets/image_screen2.png',
                      'A Song of Moon',
                      'Start with the basics',
                      '9 Sessions',
                      170,
                      const Color(0xFFF2C94C)),
                  const SizedBox(height: 10),
                  ...List.generate(2, (int) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2 - 15,
                          child: cardTest(
                              'assets/image_screen2.png',
                              'A Song of Moon',
                              'Start with the basics',
                              '9 Sessions',
                              100,
                              const Color(0xFFF09235)),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2 - 15,
                          child: cardTest(
                              'assets/image_screen2.png',
                              'A Song of Moon',
                              'Start with the basics',
                              '9 Sessions',
                              100,
                              const Color(0xFFF2C94C)),
                        ),
                      ],
                    );
                  }),
                  const SizedBox(height: 10),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget cardTest(String path, String text1, String text2, String text3,
      double height, Color color) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: color,
            ),
            child: Image.asset(path),
          ),
          Container(
            height: 70,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    text1,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 5),
                  Flexible(child: Text(text2)),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.favorite_border),
                      const SizedBox(width: 5),
                      Text(
                        text3,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const Spacer(),
                      const Text(
                        'Start',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 12,
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
