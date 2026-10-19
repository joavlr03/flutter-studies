import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sorting_app/components/sorting_button.dart';

void main() {
runApp(const SortingHatApp());
}
class SortingHatApp extends StatelessWidget {
const SortingHatApp({super.key});
@override
Widget build(BuildContext context) {
 return MaterialApp(
 debugShowCheckedModeBanner: false,
 title: "Chapéu Seletor",
 theme: ThemeData(brightness: Brightness.dark,
fontFamily: "Cinzel"),
 home: const SortingHatScreen(),
 );
 }
}

class SortingHatScreen extends StatefulWidget {
const SortingHatScreen({super.key});
@override
State<SortingHatScreen> createState() => _SortingHatScreenState();
}
class _SortingHatScreenState extends State<SortingHatScreen> {

  SortingState state = SortingState.idle;
  List<String> houses = ["Grifinoria", "Sonserina", "Lufa-Lufa", "Corvinal"];

  String houseSelecionada = "";

  Future <void> sortHouse() async{
    final random = Random();
    
      houseSelecionada =  houses[random.nextInt(houses.length)]; 
      state = SortingState.result;

     await Future.delayed(const Duration(seconds: 3));
    
    setState(() {

   
    });
  }
@override
Widget build(BuildContext context) {
 return Column(
 children: [
 // AQUI SERAO ADICIONADOS OS COMPONENTES DA TELA
  Text(houseSelecionada),
  SortingButton(state: state, onPressed: sortHouse)
 ],
 );
}
}


 

