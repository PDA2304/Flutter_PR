import 'package:flutter/material.dart';

class ScreenThree extends StatelessWidget {
  const ScreenThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xFFF2C94C),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset('assets/image_screen3.png'),
              ),
              const SizedBox(height: 15),
              const Text(
                'Peter Mach',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Mind Deep Relax',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 15),
              const Text(
                'Join the Community as we prepare over 33 days to relax and feel joy with the mind and happnies session across the World.',
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 25),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF039EA2),
                  borderRadius: BorderRadius.circular(100),
                ),
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.play_arrow_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Play Next Session',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // card(),
              // const SizedBox(height: 10),
              // card(),
              // const SizedBox(height: 10),
              // card(),
              ...List.generate(3, (index) {
                return Column(
                  children: [
                    card(),
                    const SizedBox(height: 10),
                  ],
                );
              })
            ],
          ),
        ),
      ),
    );
  }

  Widget card() {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Color(0xFF2F80ED),
              borderRadius: BorderRadius.circular(10)),
          width: 42,
          height: 42,
          child: const Icon(
            Icons.play_arrow_outlined,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Sweet Memories',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
            ),
            Text(
              'December 29 Pre-Launch',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        Spacer(),
        Icon(
          Icons.run_circle,
          color: Colors.grey,
        )
      ],
    );
  }
}
