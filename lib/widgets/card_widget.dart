// lib/widgets/custom_card.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCard extends StatelessWidget {
  final Color cardColor;
  final String cardText;

  const CustomCard({super.key, required this.cardColor, required this.cardText});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: FittedBox(
            child: Text(
              cardText,
              style: GoogleFonts.amaranth(fontSize: 50, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
