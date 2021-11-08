import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../widgets/board_view.dart';
import '../models/model.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:dart_random_choice/dart_random_choice.dart';

class WhellFortune extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WhellFortuneState();
  }
}

class _WhellFortuneState extends State<WhellFortune>
    with SingleTickerProviderStateMixin {
  int percent = 0;
  int game_status = 0;
  String _current_no;
  String _instruct = "Take a spin to start the game";
  Color _instructcolor = Colors.grey[600];
  String _move = " ";
  Color _movecolor;
  String _act = " ";
  Color _actcolor = Colors.amber;

  double _angle = 0;
  double _current = 0;
  AnimationController _ctrl;
  Animation _ani;

  List<Luck> _items = [
    Luck("apple", Color(0xFF9F6083), "1"),
    Luck("raspberry", Color(0xFFFDB78B), "2"),
    Luck("grapes", Color(0xFF57CFE2), "3"),
    Luck("fruit", Color(0xFF606B7E), "4"),
    Luck("milk", Color(0xFF24ACE9), "5"),
    Luck("salad", Color(0xFFFB7C7A), "6"),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var _duration = Duration(milliseconds: 5000);
    _ctrl = AnimationController(vsync: this, duration: _duration);
    _ani = CurvedAnimation(parent: _ctrl, curve: Curves.fastLinearToSlowEaseIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: game_status == 0
              ? BoxDecoration(
                  color: Colors.blueGrey,
                )
              : BoxDecoration(
                  image: DecorationImage(
                  image: AssetImage("assets/images/wheel.jpg"),
                  fit: BoxFit.cover,
                )),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
              Widget>[
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: AnimatedBuilder(
                  animation: _ani,
                  builder: (context, child) {
                    final _value = _ani.value;
                    final _angle = _value * this._angle;
                    return Row(children: <Widget>[
                      Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          BoardView(
                              items: _items, current: _current, angle: _angle),
                          _buildGo(),
                        ],
                      ),
                      _buildResult(_value),
                    ]);
                  }),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Card(
                color: Color(0xFF24ACE9),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "GAME STATUS",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              game_status == 0
                  ? Card(
                      color: Colors.grey,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "GAME-OFF",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  : Card(
                      color: Color(0xFF24ACE9),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "GAME-ON",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                  left: 0.0,
                  right: 0.0,
                ),
                child: Card(
                  color: Colors.white,
                  child: IconButton(
                    icon: Icon(
                      Icons.lightbulb_outline,
                      color: _instructcolor,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                  left: 0.0,
                  right: 0.0,
                ),
                child: Container(
                  child: Card(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Center(
                        child: Text(
                          _instruct,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: _instructcolor,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
            game_status == 1
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 15,
                            left: 0.0,
                            right: 0.0,
                          ),
                          child: Card(
                            color: Colors.white,
                            child: IconButton(
                              icon: Icon(
                                Icons.call_to_action,
                                color: _actcolor,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 15,
                            left: 0.0,
                            right: 0.0,
                          ),
                          child: Container(
                            child: Card(
                              color: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.all(15),
                                child: Center(
                                  child: Text(
                                    _act,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: _actcolor,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ])
                : Row(),
            game_status == 1
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Container(
                            color: Colors.white,
                            width: MediaQuery.of(context).size.width * 0.95,
                            child: Text(
                              " \n\n" + _move + "\n\n ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ])
                : Row(),
            game_status == 1
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 30, bottom: 30),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.95,
                            height: MediaQuery.of(context).size.height * 0.17,
                            child: LiquidLinearProgressIndicator(
                              value: percent / 100, // Defaults to 0.5.
                              valueColor:
                                  AlwaysStoppedAnimation(Colors.amberAccent),
                              backgroundColor: Colors.grey[400],
                              borderColor: Colors.grey[400],
                              borderWidth: 1.0,
                              direction: Axis.horizontal,
                              center: Text(
                                "PROGRESS: " + percent.toString() + "%",
                                style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ])
                : Row(),
          ])),
    );
  }

  _buildGo() {
    return Material(
      color: Colors.white,
      shape: CircleBorder(),
      child: InkWell(
        customBorder: CircleBorder(),
        child: Container(
          alignment: Alignment.center,
          height: 84,
          width: 84,
          child: Text(
            "SPIN",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
        onTap: _animation,
      ),
    );
  }

  _animation() {
    if (!_ctrl.isAnimating) {
      var _random = Random().nextDouble();
      _angle = 20 + Random().nextInt(5) + _random;
      _ctrl.forward(from: 0.0).then((_) {
        _current = (_current + _random);
        _current = _current - _current ~/ 1;
        // _alert(context); //end whell

        setState(() {
          //Game Status Engine
          if (game_status == 0) {
            if (_current_no == "6") {
              game_status = 1;
              _instructcolor = Color(0xFF24ACE9);
              _instruct = "Game Started! You can now continue";
              _alert(context);
            } else {
              _instruct = "Oops! You need a SIX to start the game";
            }
          }

          //  GAME FINISHER ENGINE
          if (game_status == 1) {
            percent += int.parse(_current_no) * 1;
          }

          if (percent >= 100) {
            _finish_alert(context);
            percent = 0;
            game_status = 0;
            _instruct = "Take a spin to start the game";
            _instructcolor = Colors.grey[600];
            _move = " ";
            _act = " ";
            _actcolor = Colors.amber;
          }

          //Game Progress Engine
          if (game_status == 1) {
            _instructcolor = Colors.grey[600];
            _instruct = "You just rolled a " + _current_no;
            _move = "You were moved forward by " + _current_no + " step(s)";
            shuffle_actions();
            _act = "You posted a fake news article";
          }
        });
        _ctrl.reset();
      });
    }
  }

  _alert(
    BuildContext context,
  ) {
    var alertStyle = AlertStyle(
      animationType: AnimationType.shrink,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: TextStyle(fontWeight: FontWeight.bold),
      animationDuration: Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(
          color: Colors.grey,
        ),
      ),
      titleStyle: TextStyle(
        color: Color(0xFF24ACE9),
      ),
    );
    Alert(
      context: context,
      style: alertStyle,
      type: AlertType.none,
      title: "GAME STARTED",
      desc: "You just rolled a SIX.",
      buttons: [
        DialogButton(
          child: Text(
            "CONTINUE",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Color(0xFF24ACE9),
        ),
      ],
    ).show();
  }

  _finish_alert(
    BuildContext context,
  ) {
    var alertStyle = AlertStyle(
      animationType: AnimationType.shrink,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: TextStyle(fontWeight: FontWeight.bold),
      animationDuration: Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(
          color: Colors.grey,
        ),
      ),
      titleStyle: TextStyle(
        color: Color.fromRGBO(0, 179, 134, 1.0),
      ),
    );
    Alert(
      context: context,
      style: alertStyle,
      type: AlertType.none,
      title: "GAME COMPLETE",
      desc: "You reached the end of your progress track!",
      buttons: [
        DialogButton(
          child: Text(
            "GO BACK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.green,
        ),
      ],
    ).show();
  }

  int _calIndex(value) {
    var _base = (2 * pi / _items.length / 2) / (2 * pi);
    return (((_base + value) % 1) * _items.length).floor();
  }

  shuffle_actions() {
    var map = {
      'You posted a fake news article': -1,
      'You reported a fake news': 2,
      ' ': 3
    };
    var _listv = map.values.toList();
    var _listk = map.keys.toList();
    var rng = new Random();
    var nxtInt = rng.nextInt(3);
    print(_listk[nxtInt]);
    print(_listv[nxtInt]);
  }

  _buildResult(_value) {
    var _index = _calIndex(_value * _angle + _current);
    _current_no = _items[_index].point;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 48.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 4,
            ),
            Card(
              color: Colors.white,
              child: Padding(
                padding:
                    EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                child: Text(
                  _items[_index].point,
                  style: TextStyle(
                      fontSize: 80,
                      color: Colors.amber,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ), //gosterim
      ),
    );
  }
}
