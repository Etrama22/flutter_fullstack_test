// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class FurnitureCarousel extends StatefulWidget {
  const FurnitureCarousel({super.key});

  @override
  State<FurnitureCarousel> createState() => _FurnitureCarouselState();
}

class _FurnitureCarouselState extends State<FurnitureCarousel> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  final List<Map<String, String>> carouselItems = [
    {
      "title": "Cari Furnitur Impian",
      "subtitle": "Cari furnitur mulai dari meja, lemari, hingga rak disini",
    },
    {
      "title": "Diskon Spesial Akhir Tahun",
      "subtitle": "Dapatkan potongan harga hingga 50% untuk item tertentu.",
    },
    {
      "title": "Koleksi Terbaru 2025",
      "subtitle": "Desain minimalis dan modern untuk rumah Anda.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              const SizedBox(height: 20),
              CarouselSlider.builder(
                itemCount: carouselItems.length,
                carouselController: _controller,
                itemBuilder: (context, index, realIndex) {
                  final item = carouselItems[index];
                  return buildCarouselItem(item['title']!, item['subtitle']!);
                },
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  viewportFraction: 0.9,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
              ),
            ],
          ),

          Positioned(
            top: 170,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: carouselItems.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 4.0,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          (Theme.of(context).brightness == Brightness.dark
                                  ? Colors.white
                                  : const Color(0xFFFF7900))
                              .withOpacity(_current == entry.key ? 0.9 : 0.4),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCarouselItem(String title, String subtitle) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.white),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 160,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/images/DummyCarouselImage.png'),
                fit: BoxFit.cover,
              ),
              color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
              borderRadius: BorderRadius.circular(8),
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 4),
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
