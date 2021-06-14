import 'dart:async';

import 'package:cully_strength_app/src/Models/Exercise.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExerciseCard extends StatefulWidget {
  final Exercise exercise;

  ExerciseCard({Key? key, required this.exercise}) : super(key: key);

  @override
  _ExerciseCard createState() => _ExerciseCard();
}

class _ExerciseCard extends State<ExerciseCard> {

  int? _setsCompleted = 0;
  Stopwatch? _stopwatch;
  Timer? _timer;
  bool _resting = true;
  String _buttonText = "Start Set";

  String formatTime(int milliseconds) {
    var secs = milliseconds ~/ 1000;
    var hours = (secs ~/ 3600).toString().padLeft(2, '0');
    var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
    var seconds = (secs % 60).toString().padLeft(2, '0');
    return "$hours:$minutes:$seconds";
  }

  void handleStartStop() {
    var setsAddition = 0;
    var buttonText = "";
    if (_resting) {
      buttonText = "Start Set";
    }
    else buttonText = "End Set";
    if (_stopwatch!.isRunning) {
      if (!_resting) setsAddition = 1;
      else setsAddition = 0;
      _stopwatch!.reset();
      setState(() {
        _setsCompleted = _setsCompleted! + setsAddition;
        _resting = !_resting;
        _buttonText = buttonText;
      });
    } else {
      _stopwatch!.start();
      setState(() {
        _resting = !_resting;
        _buttonText = buttonText;
      });
    }// re-render the page
  }

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
    // re-render every 30ms
    _timer = new Timer.periodic(new Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Text(
                        widget.exercise.name,
                        style: TextStyle(fontSize: 30),
                      )
                  ),
                ]
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Text(
                      (widget.exercise.max * widget.exercise.multiplier).toString(),
                      style: TextStyle(fontSize: 60),
                    )
                )
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "$_setsCompleted/${widget.exercise.reps}",
                    style: TextStyle(fontSize: 30),
                  ),
                )
              ],
            ),
            Text(formatTime(_stopwatch!.elapsedMilliseconds), style: TextStyle(fontSize: 48.0)),
            ElevatedButton(
                onPressed: handleStartStop,
                child: Text(_resting == false ? 'End Set' : 'Start Set'))
          ],
        ),
      ),
    );
  }
}