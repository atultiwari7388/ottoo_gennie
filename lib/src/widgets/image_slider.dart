import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  // const ImageSlider({ Key? key }) : super(key: key);

  // create a image slider list

  final List<String> imageList = [
    "assets/slide_1.jpg",
    "assets/slide_2.jpg",
    "assets/slide_3.jpg",
    "assets/slide_4.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        autoPlay: true,
      ),
      items: imageList
          .map((e) => ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Image.asset(
                      e,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.scaleDown,
                    ),
                  ],
                ),
              ))
          .toList(),
    );
  }
}
