import 'dart:async';
import 'dart:math';
// import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/game_model.dart';

class DicePage extends StatefulWidget {
  GameModel gameModel;
  String player;

  DicePage(this.player, this.gameModel);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  Size size;

  double width;

  double height;

  @override
  initState() {
    super.initState();
    // print('gotten here... ${widget.gameModel.playerAplaying()}');
  }

  void updateDices(DiceModel dice) async {
    for (int i = 0; i < 6; i++) {
      // print(i);
      await Future.delayed(const Duration(milliseconds: 300));
      dice.generateDiceOne();
    }
    widget.gameModel.diceVal =
        "${widget.player} ${dice.diceOneCount.toString()}";
    await widget.gameModel.gamePlay(widget.gameModel.diceVal).then((value) {});
  }

  @override
  Widget build(BuildContext context) {
    List<String> _diceOneImages = [
      "assets/dice1.png",
      "assets/dice2.png",
      "assets/dice3.png",
      "assets/dice4.png",
      "assets/dice5.png",
      "assets/dice6.png",
    ];
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    final dice = Provider.of<DiceModel>(context);
    final c = dice.diceOneCount;
    var img = Image.asset(
      _diceOneImages[c - 1],
      gaplessPlayback: true,
      width: height * 0.11160714,
      height: height * 0.11160714,
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                onTap: () async {
                  if (widget.gameModel.playerAplaying()) {
                    for (int i = 0; i < 6; i++) {
                      print(i);
                      await Future.delayed(const Duration(milliseconds: 300));
                      dice.generateDiceOne();
                    }
                    widget.gameModel.diceVal =
                        "${widget.player} ${dice.diceOneCount.toString()}";
                    await widget.gameModel
                        .gamePlay(widget.gameModel.diceVal)
                        .then((value) {
                      if (!widget.gameModel.playerAplaying()) {
                        Future.delayed(Duration(milliseconds: 1600),
                            () => updateDices(dice));
                      }
                    });
                  } else {
                    return;
                  }
                },
                child: img,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class DiceModel with ChangeNotifier {
  int diceOne = 1;

  int get diceOneCount => diceOne;

  void generateDiceOne() {
    diceOne = Random().nextInt(5) + 1;
    // print("diceOne: $diceOne");
    notifyListeners();
  }
}
