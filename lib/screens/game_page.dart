import 'package:educand/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/game_model.dart';
import '../models/player_model.dart';
import '../take_points_out_for_snakes_ladder.dart';
import 'dice_roll.dart';
import 'line_painter.dart';
import 'spacers.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<GlobalKey> list;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  Size size;
  double width;
  double height;
  GameModel gameModel = GameModel();

  @override
  void initState() {
    super.initState();
    list = List<GlobalKey>.generate(100, (_) => GlobalKey());
    WidgetsBinding.instance.addPostFrameCallback((d) {
      setState(() {
        takeOutPoint(list);
      });
      laddersRender();
      snakeRender();
    });
  }

  final ladderChildren = <Widget>[];
  final snakeChildren = <Widget>[];
  laddersRender() {
    for (int i = 0; i < ladderPointsA.length; i++) {
      ladderChildren.add(CustomPaint(
        size: Size(width, height),
        painter: MyPainter(
          point1: ladderPointsA[i],
          point2: ladderPointsB[i],
          pointOrigin: p0,
          px: size.width > 700 ? Offset(0, 0) : px,
        ),
      ));
    }
  }

  snakeRender() {
    for (int i = 0; i < snakePointsA.length; i++) {
      snakeChildren.add(CustomPaint(
        size: Size(width, height),
        painter: SnakePainter(
          point1: snakePointsA[i],
          point2: snakePointsB[i],
          pointOrigin: p0,
          px: size.width > 700 ? Offset(0, 0) : px,
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: c15,
      appBar: AppBar(
        title: Text(
          "MIL Board Game",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Poppins',
          ),
        ),
        titleSpacing: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 18,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: false,
        elevation: 0.0,
        backgroundColor: c15,
        // foregroundColor: c15,
      ),
      body: SafeArea(
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider<GameModel>(
              create: (context) => GameModel(),
            ),
            ChangeNotifierProvider<PlayerModel>(
              create: (context) => PlayerModel(context),
            ),
            ChangeNotifierProvider<DiceModel>(
              create: (BuildContext context) {
                return DiceModel();
              },
            ),
          ],
          child: Consumer<PlayerModel>(
            builder: (context, playerM, _) => Stack(
              children: [
                Column(
                  children: <Widget>[
                    Ymargin(x: 30.0),

                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: Container(
                          height: height * 0.447,
                          child: Stack(
                            children: [
                              Consumer<GameModel>(
                                builder: (context, gameM, _) => Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        width: 2.5,
                                        color: c14,
                                      )),
                                  padding: EdgeInsets.all(4),
                                  child: GridView.builder(
                                      itemCount: 100,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 10,
                                        mainAxisSpacing: 0,
                                        crossAxisSpacing: 0,
                                      ),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                          ),
                                          margin: EdgeInsets.all(0),
                                          key: list[index],
                                          color: (((99 - index) + 1) == 6 ||
                                                  ((99 - index) + 1) == 10 ||
                                                  ((99 - index) + 1) == 14 ||
                                                  ((99 - index) + 1) == 30 ||
                                                  ((99 - index) + 1) == 33 ||
                                                  ((99 - index) + 1) == 38 ||
                                                  ((99 - index) + 1) == 49 ||
                                                  ((99 - index) + 1) == 70)
                                              ? c10
                                              : (((99 - index) + 1) == 25 ||
                                                      ((99 - index) + 1) ==
                                                          25 ||
                                                      ((99 - index) + 1) ==
                                                          26 ||
                                                      ((99 - index) + 1) ==
                                                          29 ||
                                                      ((99 - index) + 1) ==
                                                          58 ||
                                                      ((99 - index) + 1) ==
                                                          72 ||
                                                      ((99 - index) + 1) ==
                                                          89 ||
                                                      ((99 - index) + 1) ==
                                                          96 ||
                                                      ((99 - index) + 1) == 98)
                                                  ? c11
                                                  : (10 <= index &&
                                                              index <= 19) ||
                                                          (30 <= index &&
                                                              index <= 39) ||
                                                          (50 <= index &&
                                                              index <= 59) ||
                                                          (70 <= index &&
                                                              index <= 79) ||
                                                          (90 <= index &&
                                                              index <= 99)
                                                      ? index.isOdd
                                                          ? c13
                                                          : c14
                                                      : index.isEven
                                                          ? c13
                                                          : c14,
                                          child: Stack(
                                            children: [
                                              (99 - index) ==
                                                      playerModel.playerAmove
                                                  ? Align(
                                                      alignment: index == 99
                                                          ? Alignment.topLeft
                                                          : Alignment.center,
                                                      child: Container(
                                                        width: height * 0.056,
                                                        height: height * 0.056,
                                                        decoration:
                                                            new BoxDecoration(
                                                          color: Color.fromRGBO(
                                                              241, 69, 211, 1),
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                      ),
                                                    )
                                                  : SizedBox(),
                                              (99 - index) ==
                                                      playerModel.playerBmove
                                                  ? Align(
                                                      alignment: index == 99
                                                          ? Alignment
                                                              .bottomRight
                                                          : Alignment.center,
                                                      child: Container(
                                                        width: height * 0.056,
                                                        height: height * 0.056,
                                                        decoration:
                                                            new BoxDecoration(
                                                          color: Colors.orange,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                      ),
                                                    )
                                                  : SizedBox(),
                                              Container(
                                                child: Center(
                                                  child: Text(
                                                    ((99 - index) + 1)
                                                        .toString(),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize:
                                                            ((99 - index) + 1) <
                                                                    100
                                                                ? 24
                                                                : 20,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Ymargin(x: height * 0.081),
                    Container(
                      child: Consumer<GameModel>(
                          builder: (context, gameModel, child) {
                        return Row(
                          // direction: Axis.vertical,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(height * 0.056),
                              ),
                              color: gameModel.diceVal == "init"
                                  ? Color.fromRGBO(241, 69, 211, 1)
                                  : gameModel.playerAplaying()
                                      ? Color.fromRGBO(241, 69, 211, 1)
                                      : Color.fromRGBO(253, 151, 39, 1),
                              child: Container(
                                width: height * 0.11160714,
                                decoration:
                                    BoxDecoration(shape: BoxShape.circle),
                                height: height * 0.11160714,
                                child: Center(
                                  child: Text(
                                    gameModel.playerAplaying() ? "P1" : "P2",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                                height: height * 0.11160714,
                                width: height * 0.11160714,
                                child: Consumer<DiceModel>(
                                  builder: (contex, diceModel, _) => DicePage(
                                      gameModel.playerAplaying()
                                          ? "player1"
                                          : "player2",
                                      gameModel),
                                )),
                          ],
                        );
                      }),
                    ),
                    // ),
                    Ymargin(x: 10.0),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 4.0),
                      child: Container(
                        height: height * 0.1414,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.transparent,
                        ),
                        child: Center(
                            child: Text(
                          "Tap the Dice to Play",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
                Consumer<GameModel>(
                  builder: (contex, gameModel, _) => Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                    child: AnimatedContainer(
                      duration: Duration(
                        milliseconds: 700,
                      ),
                      height: gameModel.imDone ? 0.0 : height * 0.0674,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          gameModel.diceVal.toString().trim() == 'init'
                              ? ''
                              : '${gameModel.computer ? 'Computer' : 'You'} rolled a ${int.parse(gameModel.diceVal.toString().trim().replaceRange(0, 7, "").trim())}',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 22),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
