import 'package:flutter/material.dart';
  
enum SortingState { idle, sorting, result }

class SortingButton extends StatelessWidget {
final VoidCallback onPressed;
final SortingState state;
const SortingButton({
 super.key,
 required this.onPressed,
 required this.state,
 });

 @override
Widget build(BuildContext context) {
 String text;
 switch (state) {
 case SortingState.idle:
 text = "Descobrir minha casa";
 break;
 case SortingState.sorting:
 text = "Pensando...";
 break;
 case SortingState.result:
 text = "Sua casa foi escolhida";
 break;
 }

 return Padding(
 padding: const EdgeInsets.symmetric(horizontal: 40),
 child: ElevatedButton(style: ElevatedButton.styleFrom(
 backgroundColor: const Color(0xFF5D4037),
 foregroundColor: Colors.white,
 padding: const EdgeInsets.symmetric(vertical: 16),
 shape: RoundedRectangleBorder(
 borderRadius: BorderRadius.circular(18),
 ),
 ),
 onPressed: state == SortingState.idle ? onPressed : null,
 child: Row(
 mainAxisAlignment: MainAxisAlignment.center,
 children: [
 Image.asset("assets/images/icone_chapeu_seletor.png",
 height: 40,
 color: Colors.white,
 ),
 const SizedBox(width: 12),
 Text(text, style: const TextStyle(fontSize: 18)),
 ],
 ),
 ),
 );
 }
}