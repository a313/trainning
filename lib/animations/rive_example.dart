import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
import 'package:trainning/share_widgets/custom_button.dart';
import 'package:trainning/utils/base_scaffold.dart';
import 'package:trainning/utils/extentsions.dart';

class RiveExample extends StatefulWidget {
  const RiveExample({Key? key}) : super(key: key);

  @override
  State<RiveExample> createState() => _State();
}

class _State extends State<RiveExample> with SingleTickerProviderStateMixin {
  SMITrigger? _bump;

  bool get isPlaying => _controller?.isActive ?? false;
  StateMachineController? _controller;
  SMIInput<bool>? _anim1;
  SMIInput<bool>? _anim2;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 200,
            child: RiveAnimation.asset(
              "assets/rives/842-1644-snowday.riv",
              fit: BoxFit.fitHeight,
            ),
          ),
          SizedBox(
            height: 200,
            child: GestureDetector(
              child: RiveAnimation.network(
                'https://cdn.rive.app/animations/vehicles.riv',
                fit: BoxFit.cover,
                onInit: _onRiveInit,
              ),
              onTap: _hitBump,
            ),
          ),
          FutureBuilder<Artboard>(
            future: loadData(),
            builder: (context, artboard) => MouseRegion(
              onEnter: (_) => _anim1?.value = true,
              onExit: (_) => _anim1?.value = false,
              child: SizedBox(
                height: 250,
                child: artboard.data != null
                    ? Rive(artboard: artboard.data!)
                    : const CircularProgressIndicator(),
              ),
            ),
          ),
          16.height,
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              CustomButton(
                  label: 'Anim 1',
                  onTap: () {
                    _anim1!.value = !_anim1!.value;
                  }),
              CustomButton(
                  label: 'Anim 2',
                  onTap: () {
                    _anim2!.value = !_anim2!.value;
                  })
            ],
          )
        ],
      ),
      title: 'Rives',
    );
  }

  void _onRiveInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(artboard, 'bumpy');
    artboard.addController(controller!);
    _bump = controller.findInput<bool>('bump') as SMITrigger;
  }

  void _hitBump() => _bump?.fire();

  Future<Artboard> loadData() async {
    final data = await rootBundle.load('assets/rives/rocket.riv');
    final file = RiveFile.import(data);
    final artboard = file.mainArtboard;
    var controller = StateMachineController.fromArtboard(artboard, 'Button');
    if (controller != null) {
      artboard.addController(controller);
      _anim1 = controller.findInput('Hover');
      _anim2 = controller.findInput('Press');
    }
    return artboard;
  }
}
