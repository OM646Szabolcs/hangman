import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hangman/controllers/game_view_controller.dart';

class GameView extends StatelessWidget {
 GameViewController controller=Get.put(GameViewController());
 
 
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GameViewController>(
      init: controller,
      builder: (_) {
        return Scaffold(
                appBar: AppBar(
        title: Text("Hangman"),
        ),
        body: Column(
          children: [
            Image.asset("images/${controller.hibakSzama()}.png"),
            Text(controller.randomSzoveg),
            Text(controller.csillagosSzoveg),
            Column(
              children: [
                Row(
                  children: [
                    CupertinoButton.filled(
                    padding: EdgeInsets.zero, 
                    child: Text("A"),
                    onPressed: () {
                    controller.tippHozzaadasa("A");
                    })
                  ],
                )
              ],
            )
            
                
              
            ],
          ),
        );
      },
    );
  }
}



//CupertinoButton(
  //            child: Text("Generálj ujjat"),
   //           onPressed: () {controller.randomSzovegGeneralasa();