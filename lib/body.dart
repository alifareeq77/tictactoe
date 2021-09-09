import 'package:flutter/material.dart';
import 'package:decorated_icon/decorated_icon.dart';
import 'package:tictactoy/xtrue_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _botScore = 0;
  int m = 0;
  bool? _visibile = true;
  String lastc = " ";
  int i = 0; // O wins
  int x = 0; // x wins
  int d = 0; // d draw
  int k = 0;
  int dr = 0;
  bool? isSwitched = false;
  List<String> displayExOh = [" ", " ", " ", " ", " ", " ", " ", " ", " "];
  String player1 = "o";
  String player2 = "x";
  String _winner = " ";
  String player = "o";
  String bot = "x";
  final Color _color = const Color(0xff01579b);
  void _tapped(indexed) {
    setState(() {
      if (player == player1 && displayExOh[indexed] == " ") {
        displayExOh[indexed] = "O";
        player = player2;
        _visibile = false;
        dr += 1;
      }
      //  else if (player == player2 && displayExOh[indexed] == " ") {
      //   displayExOh[indexed] = "X";
      //   player = player1;
      //   _visibile = false;
      //   dr += 1;
      // }
    });
  }

  void _botMove() {
    for (int l = 0; l < 9; l++) {
      if (displayExOh[l] == displayExOh[l + 1]) {
        _botScore += 25;
      }
      if (m <= _botScore) {
        m = _botScore;
        _botScore = 0;
      }
    }
  }

  void checkwin() {
    if (displayExOh[0] == displayExOh[4] &&
        displayExOh[0] == displayExOh[8] &&
        displayExOh[0] != " ") {
      _winner = displayExOh[0];
      _showDilog();

      dr = 0;
    } else if (displayExOh[0] == displayExOh[1] &&
        displayExOh[1] == displayExOh[2] &&
        displayExOh[0] != " ") {
      _showDilog();
      _winner = displayExOh[0];
      dr = 0;
    } else if (displayExOh[2] == displayExOh[5] &&
        displayExOh[5] == displayExOh[8] &&
        displayExOh[2] != " ") {
      _showDilog();
      _winner = displayExOh[2];
      dr = 0;
    } else if (displayExOh[1] == displayExOh[4] &&
        displayExOh[4] == displayExOh[7] &&
        displayExOh[1] != " ") {
      _showDilog();
      _winner = displayExOh[1];
      dr = 0;
    } else if (displayExOh[0] == displayExOh[3] &&
        displayExOh[3] == displayExOh[6] &&
        displayExOh[0] != " ") {
      _showDilog();
      _winner = displayExOh[0];
      dr = 0;
    } else if (displayExOh[2] == displayExOh[4] &&
        displayExOh[4] == displayExOh[6] &&
        displayExOh[2] != " ") {
      _showDilog();
      _winner = displayExOh[6];
      dr = 0;
    } else if (displayExOh[3] == displayExOh[4] &&
        displayExOh[3] == displayExOh[5] &&
        displayExOh[3] != " ") {
      _showDilog();
      _winner = displayExOh[6];
      dr = 0;
    } else if (displayExOh[6] == displayExOh[7] &&
        displayExOh[7] == displayExOh[8] &&
        displayExOh[6] != " ") {
      _showDilog();
      _winner = displayExOh[6];
      dr = 0;
    }
    if (_winner == "X") {
      x += 1;
    } else if (_winner == "O") {
      i += 1;
    } else if (_winner != "X" && _winner != "O" && dr == 9) {
      d += 1;
      dr = 0;
      _showDraw();
    }
  }

  void _showDraw() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Draw"),
            actions: [
              TextButton(
                onPressed: () {
                  _rester();
                  Navigator.of(context).pop();
                },
                child: const Text("restart"),
              ),
            ],
          );
        });
  }

  void _rester() {
    setState(() {
      for (k; k < 9; k++) {
        displayExOh[k] = " ";
        _winner = " ";
      }
      k = 0;

      _visibile = true;
    });
  }

  void _showDilog() {
    Alert(
      style: AlertStyle(
          animationType: AnimationType.fromBottom,
          isOverlayTapDismiss: false,
          animationDuration: const Duration(milliseconds: 500),
          backgroundColor: Colors.white,
          alertBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          titleStyle: const TextStyle(color: Colors.red)),
      context: context,
      type: AlertType.none,
      title: " $_winner ".toUpperCase() + "Won!",
      desc: "Press the restart button to restart",
      buttons: [
        DialogButton(
          color: Colors.grey,
          child: const Text(
            "Restart",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            _rester();
            Navigator.of(context).pop();
          },
          width: 120,
        )
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // first row
          margin: const EdgeInsets.only(top: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, border: Border()),
                child: const DecoratedIcon(
                  Xtrue.circle_ring_svgrepo_com,
                  color: Colors.lightBlue,
                  size: 40,
                  shadows: [
                    BoxShadow(
                      blurRadius: 50.0,
                      color: Colors.black26,
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: Icon(Xtrue.xshape, color: _color, size: 30),
              ),
              const SizedBox(
                child: Icon(
                  Xtrue.balance,
                  color: Colors.grey,
                  size: 40,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          // color: Colors.blue,
          height: 40,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  alignment: const Alignment(0.4, -1),
                  child: Text("$i wins",
                      style: GoogleFonts.balooTammudu(
                        color: Colors.lightBlue,
                        fontSize: 17,
                      )),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  // color: Colors.black,
                  alignment: const Alignment(0.19, -1),
                  child: Text("$x wins",
                      style: GoogleFonts.balooTammudu(
                          color: _color, fontSize: 17)),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.only(left: 8, right: 8, top: 1),
                  // color: Colors.orange,
                  padding: const EdgeInsets.only(left: 16.5),
                  child: Text("$d Draws",
                      style: GoogleFonts.balooTammudu(
                          color: Colors.grey, fontSize: 17)),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        SizedBox(
          height: 450,
          // color: Colors.blue,
          child: GridView.builder(
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    _tapped(index);
                    checkwin();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.grey,
                    )),
                    child: Center(
                      child: Text(
                        displayExOh[index],
                        // index.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 80),
                      ),
                    ),
                  ),
                );
              }),
        ),
        AnimatedOpacity(
          opacity: _visibile! ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: ToggleSwitch(
            minWidth: 70.0,
            minHeight: 80.0,
            initialLabelIndex: 0,
            cornerRadius: 20.0,
            activeFgColor: Colors.white,
            inactiveBgColor: Colors.white,
            inactiveFgColor: _color,
            totalSwitches: 2,
            icons: const [Xtrue.circle_ring_svgrepo_com, Xtrue.xshape],
            iconSize: 40.0,
            activeBgColors: [
              const [Colors.lightBlue, Colors.lightBlue],
              [_color, _color]
            ],
            animate:
                true, // with just animate set to true, default curve = Curves.easeIn
            curve: Curves.decelerate,
            onToggle: (index) {
              if (index == 0 && _visibile == true) {
                player = player1;
                bot = player2;
              } else if (index == 1 && _visibile == true) {
                player = player2;
                bot = player1;
              }
            }, // animate must be set to true when using custom curve
          ),
        ),
      ],
    );
  }
}
