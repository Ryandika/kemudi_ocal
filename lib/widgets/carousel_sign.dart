import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:login_regist/data/sign_items.dart';
import 'package:login_regist/main.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SignCarousel extends StatefulWidget {
  const SignCarousel({super.key});

  @override
  State<SignCarousel> createState() => _SignCarouselState();
}

class _SignCarouselState extends State<SignCarousel> {
  final controller = CarouselController();
  int activeIndex = 0;

  Widget buildCard(String imagePath, String caption, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              shadows: <BoxShadow>[
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 1,
                ),
              ],
            ),
            padding: const EdgeInsets.only(top: 30),
            child: Image.asset(
              imagePath,
              fit: BoxFit.scaleDown,
              scale: 1.5,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            caption,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: colorScheme.onPrimaryContainer,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: signItems.length,
        effect: const JumpingDotEffect(dotWidth: 10, dotHeight: 10),
        onDotClicked: (index) {
          controller.jumpToPage(index);
        },
      );

  Widget buttonPrevNext({bool stretch = false}) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: previous,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
            ),
            child: const Icon(Icons.arrow_back_ios_new),
          ),
          stretch
              ? const Spacer()
              : const SizedBox(
                  width: 32,
                ),
          ElevatedButton(
            onPressed: next,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
            ),
            child: const Icon(Icons.arrow_forward_ios),
          )
        ],
      );
  void next() => controller.nextPage();

  void previous() => controller.previousPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rambu Peringatan'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselSlider.builder(
            itemCount: signItems.length,
            carouselController: controller,
            options: CarouselOptions(
                initialPage: 0,
                height: 400,
                viewportFraction: 1,
                onPageChanged: (index, reason) => setState(
                      () => activeIndex = index,
                    )),
            itemBuilder: (context, index, realIndex) {
              final imagePath = signItems[index].imagePath;
              final caption = signItems[index].caption;

              return buildCard(imagePath, caption, index);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          buildIndicator(),
          const SizedBox(
            height: 20,
          ),
          buttonPrevNext(),
        ],
      ),
    );
  }
}
