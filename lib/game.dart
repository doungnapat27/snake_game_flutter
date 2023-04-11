import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_snake_game/Screens/homeLogged.dart';
import 'package:flutter_snake_game/Screens/setting.dart';
import 'package:flutter_snake_game/direction_type.dart';
import 'package:flutter_snake_game/models/weather_data.dart';

import 'control_panel.dart';
import 'direction.dart';
import 'piece.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<Offset> positions = [];
  int length = 5;
  int step = 20;
  Direction direction = Direction.right;

  Piece food;
  Offset foodPosition;

  double screenWidth;
  double screenHeight;
  int lowerBoundX, upperBoundX, lowerBoundY, upperBoundY;

  Timer timer;
  double speed = 1;

  int score = 0;

  void draw() async {
    // TODO
    // 1 If positions is empty, getRandomPositionWithinRange()
    //generates a random position and starts the process.
    if (positions.length == 0) {
      positions.add(getRandomPositionWithinRange());
    }

    // 2 If the snake has just eaten the food, its length increases.
    //The while loop adds a new position to positions so that length
    //and positions are always in sync.
    while (length > positions.length) {
      positions.add(positions[positions.length - 1]);
    }

    // 3 It checks positions‘s length and shifts each position.
    // This creates the illusion that the snake is moving
    for (var i = positions.length - 1; i > 0; i--) {
      positions[i] = positions[i - 1];
    }

    // 4 Finally, getNextPosition() moves the first piece,
    // the head of the snake, to a new position.
    positions[0] = await getNextPosition(positions[0]);
  }

  Direction getRandomDirection([DirectionType type]) {
    if (type == DirectionType.horizontal) {
      bool random = Random().nextBool();
      if (random) {
        return Direction.right;
      } else {
        return Direction.left;
      }
    } else if (type == DirectionType.vertical) {
      bool random = Random().nextBool();
      if (random) {
        return Direction.up;
      } else {
        return Direction.down;
      }
    } else {
      int random = Random().nextInt(4);
      return Direction.values[random];
    }
  }

  Offset getRandomPositionWithinRange() {
    int posX = Random().nextInt(upperBoundX) + lowerBoundX;
    int posY = Random().nextInt(upperBoundY) + lowerBoundY;
    return Offset(roundToNearestTens(posX).toDouble(),
        roundToNearestTens(posY).toDouble());
  }

  bool detectCollision(Offset position) {
    // TODO
    if (setting.pieceType == 'direction') {
      if (position.dx >= upperBoundX && direction == Direction.left) {
        return true;
      } else if (position.dx <= lowerBoundX && direction == Direction.right) {
        return true;
      } else if (position.dy >= upperBoundY && direction == Direction.up) {
        return true;
      } else if (position.dy <= lowerBoundY && direction == Direction.down) {
        return true;
      }

      return false;
    } else {
      if (position.dx >= upperBoundX && direction == Direction.right) {
        return true;
      } else if (position.dx <= lowerBoundX && direction == Direction.left) {
        return true;
      } else if (position.dy >= upperBoundY && direction == Direction.down) {
        return true;
      } else if (position.dy <= lowerBoundY && direction == Direction.up) {
        return true;
      }

      return false;
    }
  }

  void showGameOverDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          title: Text(
            "Game Over",
            style: TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          content: Text(
            "${score.toString()}",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.home,
                        color: Colors.white,
                        size: 50,
                      ),
                      Text(
                        'Home',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  onPressed: () async {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeLogged()),
                    );
                  },
                ),
                TextButton(
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.refresh,
                        color: Colors.white,
                        size: 50,
                      ),
                      Text(
                        'Restart',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  onPressed: () async {
                    Navigator.of(context).pop();
                    restart();
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Future<Offset> getNextPosition(Offset position) async {
    // TODO
    Offset nextPosition;
    if (setting.pieceType == 'direction') {
      if (detectCollision(position) == true) {
        if (timer != null && timer.isActive) timer.cancel();
        await Future.delayed(
            Duration(milliseconds: 500), () => showGameOverDialog());
        return position;
      }
      if (direction == Direction.right) {
        nextPosition = Offset(position.dx - step, position.dy);
      } else if (direction == Direction.left) {
        nextPosition = Offset(position.dx + step, position.dy);
      } else if (direction == Direction.up) {
        nextPosition = Offset(position.dx, position.dy + step);
      } else if (direction == Direction.down) {
        nextPosition = Offset(position.dx, position.dy - step);
      }

      return nextPosition;
    } else {
      if (detectCollision(position) == true) {
        if (timer != null && timer.isActive) timer.cancel();
        await Future.delayed(
            Duration(milliseconds: 500), () => showGameOverDialog());
        return position;
      }
      if (direction == Direction.right) {
        nextPosition = Offset(position.dx + step, position.dy);
      } else if (direction == Direction.left) {
        nextPosition = Offset(position.dx - step, position.dy);
      } else if (direction == Direction.up) {
        nextPosition = Offset(position.dx, position.dy - step);
      } else if (direction == Direction.down) {
        nextPosition = Offset(position.dx, position.dy + step);
      }

      return nextPosition;
    }
  }

  void drawFood() {
    // TODO
    // 1
    if (foodPosition == null) {
      foodPosition = getRandomPositionWithinRange();
    }
    if (foodPosition == positions[0]) {
      length++;
      if (WeatherData.currentTemp >= 30.00) {
        speed = speed + 0.1;
      } else if (WeatherData.currentTemp < 30.00 &&
          WeatherData.currentTemp >= 15.00) {
        speed = speed + 0.08;
      } else {
        speed = speed + 0.05;
      }
      score = score + 5;
      changeSpeed();

      foodPosition = getRandomPositionWithinRange();
    }

    // 2
    food = Piece(
      posX: foodPosition.dx.toInt(),
      posY: foodPosition.dy.toInt(),
      size: step,
      color: Color(0XFF8EA604),
      isAnimated: true,
    );
  }

  List<Piece> getPieces() {
    // TODO
    //create List based on the position of the snake on the screen.
    final pieces = <Piece>[];
    draw();
    drawFood();

    // 1. use a for loop that runs until it covers the entire length of the snake.
    for (var i = 0; i < length; ++i) {
      /*2. The if block inside the for loop handles an edge case when
      the length of the snake doesn’t match the length of the positions list.
      This happens when the length of the snake increases after it eats some food.
       */
      if (i >= positions.length) {
        continue;
      }

      /* 3. For each iteration, it creates a Piece with the correct position
      and adds it to the pieces list it returns.
       */
      //store the positions of all the pieces that make up the snake in a List
      //called pieces.
      //If the snake type choose is cheese
      if (setting.pieceType == 'cheese' && i % 2 == 0) {
        pieces.add(
          Piece(
            posX: positions[i].dx.toInt(),
            posY: positions[i].dy.toInt(),
            /* 4. Along with the position, you also pass size and color to Piece.
          The size is step, in this case, which ensures that the Snake moves along a grid where each grid cell has the size step.
          The color value is a personal preference.
           */
            size: step,
            //can change color here
            color: Colors.white10,
          ),
        );
      }

      //If the snake type is not cheese
      else {
        pieces.add(
          Piece(
            posX: positions[i].dx.toInt(),
            posY: positions[i].dy.toInt(),
            size: step,
            //can change color here
            color: setting.pieceColor,
          ),
        );
      }
      ;
    }

    return pieces;
  }

  Widget getControls() {
    return ControlPanel(
      // 1  ControlPanel widget renders 4 buttons that you will use to control the snake’s movements.
      onTapped: (Direction newDirection) {
        // 2 onTapped method which recieves the new direction for the snake to move in as an argument.
        direction =
            newDirection; // 3 update the direction variable with the new direction newDirection. This will cause the snake to change direction.
      },
    );
  }

  int roundToNearestTens(int num) {
    int divisor = step;
    int output = (num ~/ divisor) * divisor;
    if (output == 0) {
      output += step;
    }
    return output;
  }

  void changeSpeed() {
    // TODO
    if (timer != null && timer.isActive) timer.cancel();

    timer = Timer.periodic(Duration(milliseconds: 200 ~/ speed), (timer) {
      setState(() {});
    });
  }

  Widget getScore() {
    return Positioned(
      top: 50.0,
      right: 40.0,
      child: Text(
        "Score: " + score.toString(),
        style: TextStyle(fontFamily: 'NanumPenScript', fontSize: 32.0),
      ),
    );
  }

  void restart() {
    // TODO
    score = 0;
    length = 5;
    positions = [];
    direction = getRandomDirection();
    speed = 1;

    changeSpeed();
  }

  Widget getPlayAreaBorder() {
    return Positioned(
      top: lowerBoundY.toDouble(),
      left: lowerBoundX.toDouble(),
      child: Container(
        width: (upperBoundX - lowerBoundX + step).toDouble(),
        height: ((upperBoundY - lowerBoundY + step)).toDouble(),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black.withOpacity(0.2),
            style: BorderStyle.solid,
            width: 1.0,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    restart();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    lowerBoundX = step;
    lowerBoundY = step;
    upperBoundX = roundToNearestTens(screenWidth.toInt() - step);
    upperBoundY = roundToNearestTens(screenHeight.toInt() - step);

    return Scaffold(
      body: Container(
        color: Colors.white10,
        child: Stack(
          children: [
            getPlayAreaBorder(),
            Stack(
              children: getPieces(),
            ),
            getControls(),
            food,
            getScore(),
          ],
        ),
      ),
    );
  }
}
