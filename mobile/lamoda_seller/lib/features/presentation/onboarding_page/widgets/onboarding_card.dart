import 'package:flutter/material.dart';

class OnboardingCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String text;

  const OnboardingCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 27
            )
          ),
          const SizedBox(height: 10),
          Text(
            text,
            style:  TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 17
            )
          ),
        ],
      ),
    );
  }
}