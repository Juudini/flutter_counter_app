import 'package:flutter/material.dart';

class CounterScreenFunctions extends StatefulWidget {
  const CounterScreenFunctions({super.key});

  @override
  State<CounterScreenFunctions> createState() => _CounterScreenFunctionsState();
}

class _CounterScreenFunctionsState extends State<CounterScreenFunctions> {
  int clickCounter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Counter App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$clickCounter',
                style:
                    const TextStyle(fontSize: 160, fontWeight: FontWeight.w100),
              ),
              Text('Click${clickCounter == 1 ? '' : 's'}',
                  style: const TextStyle(fontSize: 25))
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              icon: Icons.refresh_rounded,
              onPressed: () {
                setState(() {
                  clickCounter = 0;
                });
              },
            ),
            const SizedBox(
              height: 15,
            ),
            CustomButton(
              icon: Icons.exposure_minus_1_outlined,
              onPressed: () {
                setState(() {
                  if (clickCounter == 0) return;
                  clickCounter--;
                });
              },
            ),
            const SizedBox(
              height: 15,
            ),
            CustomButton(
              icon: Icons.plus_one,
              onPressed: () {
                setState(() {
                  clickCounter++;
                });
              },
            )
          ],
        ));
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomButton({
    required this.icon,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const StadiumBorder(),
      enableFeedback: true,
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
