import 'package:flutter/material.dart';
import 'package:sorting_app/components/hogwarts_logo.dart';

class HogwartsHeader extends StatelessWidget {
const HogwartsHeader({super.key});
@override
Widget build(BuildContext context) {
 return Column(
 children: const [
 SizedBox(height: 20),
 HogwartsLogo(),
 Text(
 "e o chapéu seletor",
 style: TextStyle(
 fontSize: 18,
 fontFamily: "CinzelDecorative",
 fontWeight: FontWeight.bold,
 ),
 ),
 ],
 );
 }
}