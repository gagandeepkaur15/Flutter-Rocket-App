import 'package:flutter/cupertino.dart';
import 'package:glassmorphism/glassmorphism.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  late ScrollController mainScroll;

  @override
  void initState() {
    mainScroll = ScrollController()
      ..addListener(() {
        setscroll();
      });
    super.initState();
  }

  double offset = 0;

  void setscroll() {
    setState(() {
      offset = mainScroll.offset;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height * 2;

    return CupertinoPageScaffold(
      child: Container(
        color: const Color.fromARGB(255, 2, 3, 12),
        child: Stack(
          children: [
            Positioned(
                bottom: offset * 0.3,
                right: 0,
                left: 0,
                child: Image.asset('assets/image5.png')),
            Positioned(
                bottom: offset * 0.5,
                right: 0,
                left: 0,
                child: Image.asset('assets/star1.png')),
            Positioned(
              top: size.height + (offset * -1 * 1),
              child: Container(
                alignment: Alignment.center,
                width: size.width,
                height: height,
                color: const Color.fromARGB(82, 255, 255, 255),
                child: Column(
                  children: const [
                    Text('Date'),
                    Text('Varient'),
                    Text('Description'),
                  ],
                ),
              ),
            ),
            Positioned.fill(
              child: SingleChildScrollView(
                controller: mainScroll,
                child: SizedBox(
                  height: height,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      GlassmorphicContainer(
                        width: 250,
                        height: 350,
                        borderRadius: 30,
                        blur: 30,
                        alignment: Alignment.center,
                        border: 2,
                        child: null,
                        linearGradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              const Color(0xFFffffff).withOpacity(0.1),
                              const Color(0xFFFFFFFF).withOpacity(0.05),
                            ],
                            stops: const [
                              0.1,
                              1,
                            ]),
                        borderGradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            const Color.fromARGB(255, 53, 213, 45)
                                .withOpacity(0.5),
                            const Color.fromARGB(255, 6, 54, 4)
                                .withOpacity(0.5),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 45,
                      ),
                      const Text(
                        'LOREM IPSUM',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: CupertinoColors.white),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CupertinoButton(
                            color: const Color.fromARGB(88, 255, 255, 255),
                            onPressed: () {},
                            child: const Icon(CupertinoIcons.news),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          CupertinoButton(
                            color: const Color.fromARGB(88, 255, 255, 255),
                            onPressed: () {},
                            child:
                                const Icon(CupertinoIcons.play_rectangle_fill),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
