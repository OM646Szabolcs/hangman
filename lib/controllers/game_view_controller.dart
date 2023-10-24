// játék logika
import 'dart:math';

import 'package:get/get.dart';
import 'package:hangman/models/tipp.dart';

class GameViewController extends GetxController {
  List<String> szovegek = [
    "alma piros",
    "kék ég", 
    "gurul a szekér",
    "OffRotty"
    ];

  String randomSzoveg = "";

  String csillagosSzoveg = "";

  void randomSzovegGeneralasa() {
    int index = Random().nextInt(szovegek.length);
    randomSzoveg = szovegek[index];
    csillagosSzoveg = "";
    for (int i = 0; i < randomSzoveg.length; i++) {
      csillagosSzoveg += "*";
    }
    update();
  }

  List<Tipp> tippek = [];

  bool nyertEaFelhasznalo() {
    return csillagosSzoveg == randomSzoveg;
  }
  bool vesztettEaFelhasznalo() {
    int szamlalo = 0;
    for (var i = 0; i < tippek.length; i++) {
      if (tippek[i].talaltE == false) {
        szamlalo++;
      }
    }
    return szamlalo == 6;
  }

  int hibakSzama() {
    int szamlalo = 0;
    for (var i = 0; i < tippek.length; i++) {
      if (tippek[i].talaltE == false) {
        szamlalo++;
      }
    }
    return szamlalo;
  }
  
  bool aMegadottBetuVolteMar(String betu) {
    bool tartalmazza = false;
    for (int i = 0; i < tippek.length; i++) {
    if(tippek[i].karakter == betu) {
        tartalmazza = true;
        break;
      }      
    }
    return tartalmazza;
  }


  void tippHozzaadasa(String betu){
    if(randomSzoveg.toLowerCase().contains(betu.toLowerCase())){
        List<String> csillagosSzovegTemp =csillagosSzoveg.split('');
        for (var i = 0; i < randomSzoveg.length; i++) {
          if(randomSzoveg[i]==betu){
            csillagosSzovegTemp[i]=betu;
          }
        }
        csillagosSzoveg = csillagosSzovegTemp.join();
        
        tippek.add(Tipp(
        karakter: betu, 
        talaltE: true,
        ));
    }else{
      tippek.add(Tipp(
        karakter: betu, 
        talaltE: false,
        ));
    }
  }

  @override
  void onInit() {
    super.onInit();
    randomSzovegGeneralasa();
  }
}