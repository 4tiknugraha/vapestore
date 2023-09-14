import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GlobalVariables {
  // static const baseUrl = 'http://103.150.93.77:1339';
  static const baseUrl = 'http://103.150.93.77:1339';
  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Paket',
      'image': 'assets/images/paket_vape.png',
    },
    {
      'title': 'Device',
      'image': 'assets/images/vape.png',
    },
    {
      'title': 'RDA',
      'image': 'assets/images/rda.png',
    },
    {
      'title': 'Liquid',
      'image': 'assets/images/liquid.png',
    },
    {
      'title': 'Coil',
      'image': 'assets/images/coil.png',
    },
    {
      'title': 'Tools',
      'image': 'assets/images/tools.png',
    },
  ];

  static const List<String> bannerImages = [
    'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/black-sketched-vape-shop-facebook-shared-imag-design-template-0215d118558ae333c6d631e7b85eb5ec_screen.jpg?ts=1611734439',
    'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/vape-shop-banner-design-template-4b86f590a55b880190d0de48a4777663_screen.jpg?ts=1609822316',
    'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/vape-shop-banner-design-template-12d0235c62e3c5943cb944aa4a635148_screen.jpg?ts=1633463075',
    // 'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/vape-shop-banner-design-template-12d0235c62e3c5943cb944aa4a635148_screen.mp4?ts=1633463075',
    // 'https://storage.googleapis.com/astro-site/home/new-user.webp',
    // 'https://storage.googleapis.com/astro-site/home/24jam.webp',
  ];

  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = const Color(0xffEE4D2D);
  static const unselectedNavBarColor = Colors.black87;
}

class CurrencyFormat {
  static String convertToIdr(dynamic number, int decimalDigit) {
    final currencyFormatter = NumberFormat.currency(locale: 'ID');
    return currencyFormatter.format(number);
  }
}
