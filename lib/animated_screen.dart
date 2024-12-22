import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
import 'package:rive_project/animated_enums.dart';

class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

//
class _AnimatedScreenState extends State<AnimatedScreen> {
  Artboard? riveArtboard;
  late RiveAnimationController IdleController;
  late RiveAnimationController BounceController;
  late RiveAnimationController Run_into_idle_Controller;
  late RiveAnimationController leftController;
  late RiveAnimationController rightController;
  late RiveAnimationController RunController;
  late RiveAnimationController Run_into_punch_Controller;
  late RiveAnimationController Jab_Punch_Controller;
  late RiveAnimationController Cross_Punch_Controller;

  @override
  void initState() {
    super.initState();
    IdleController = SimpleAnimation(AnimatedEnums.idle.name);
    BounceController = SimpleAnimation(AnimatedEnums.Bounce.name);
    Run_into_idle_Controller = SimpleAnimation("Run into idle");
    leftController = SimpleAnimation(AnimatedEnums.left.name);
    rightController = SimpleAnimation(AnimatedEnums.right.name);
    RunController = SimpleAnimation(AnimatedEnums.Run.name);
    Run_into_punch_Controller =
        SimpleAnimation(AnimatedEnums.Run_into_punch.name);
    Jab_Punch_Controller = SimpleAnimation("Jab Punch");
    Cross_Punch_Controller = SimpleAnimation("Cross Punch");
    rootBundle.load("assets/character_controller.riv").then((data) {
      final file = RiveFile.import(data);
      final artBoard = file.mainArtboard;
      print(artBoard.isPlaying);
      artBoard.addController(Cross_Punch_Controller);
      setState(() {
        riveArtboard = artBoard;
      });
    });
  }

  void removeAllControllers() {
    riveArtboard?.artboard.removeController(IdleController);
    riveArtboard?.artboard.removeController(BounceController);
    riveArtboard?.artboard.removeController(Run_into_idle_Controller);
    riveArtboard?.artboard.removeController(leftController);
    riveArtboard?.artboard.removeController(rightController);
    riveArtboard?.artboard.removeController(RunController);
    riveArtboard?.artboard.removeController(Jab_Punch_Controller);
    riveArtboard?.artboard.removeController(Cross_Punch_Controller);
    riveArtboard?.artboard.removeController(Run_into_punch_Controller);
  }

  void addIdleController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(IdleController);
    debugPrint("Idle");
  }

  void addBounceController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(BounceController);
    debugPrint("Bounce");
  }

  void addRun_into_idleController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(Run_into_idle_Controller);
    debugPrint("Run_into_idle");
  }

  void addleftController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(leftController);
    debugPrint("left");
  }

  void addrightController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(rightController);
    debugPrint("right");
  }

  void addRunController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(RunController);
    debugPrint("Run");
  }

  void addJab_PunchController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(Jab_Punch_Controller);
    debugPrint("Jab_Punch");
  }

  void addCross_PunchController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(Cross_Punch_Controller);
    debugPrint("Cross_Punch");
  }

  void addRun_into_punchController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(Run_into_punch_Controller);
    debugPrint("Run_into_punch");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Screen"),
      ),
      body: Column(
        children: [
          riveArtboard == null
              ? SizedBox.shrink()
              : SizedBox(
                  height: 300,
                  child: Rive(
                    artboard: riveArtboard!,
                  ),
                ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [

                ElevatedButton(
                  onPressed: () {
                    removeAllControllers();
                  },
                  child: Text("Idle"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        addleftController();
                      },
                      child: Text("Left"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        addrightController();
                      },
                      child: Text("Right"),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    addRunController();
                  },
                  child: Text("Run"),
                ),
                ElevatedButton(
                  onPressed: () {
                   addBounceController();
                  },
                  child: Text("Bounce"),
                ),
                ElevatedButton(
                  onPressed: () {
                  addCross_PunchController();
                  },
                  child: Text("Cross Punch"),
                ),
                ElevatedButton(
                  onPressed: () {
               addRun_into_punchController();
                  },
                  child: Text("into Punch"),
                ),
                ElevatedButton(
                  onPressed: () {
                    addJab_PunchController();
                  },
                  child: Text("Jab Punch"),
                ),
                ElevatedButton(
                  onPressed: () {
                    addRun_into_idleController();
                  },
                  child: Text("into idle"),
                ),
              ],
            ),
          )


        ],
      ),
    );
  }
}
