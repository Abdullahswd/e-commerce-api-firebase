import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

final List<PageViewModel> slides = [
  PageViewModel(
    title: "Welcome",
    body: "Discover the amazing features of the application",
    image: Image.asset('image/slide1.png'),
    decoration: const PageDecoration(
      pageColor: Colors.white,
    ),
  ),
  PageViewModel(
    title: "Ease of Use ",
    body: "Simple and ease user experience",
    image: Image.asset('image/slide2.png'),
    decoration: const PageDecoration(
      pageColor: Colors.white,
    ),
  ),
  PageViewModel(
    title: "Start Now",
    body: "Enjoy a Unique and special experience ",
    image: Image.asset('image/slide1.png'),
    decoration: const PageDecoration(
      pageColor: Colors.white,
    ),
  ),
];