import 'package:blog_app/core/common/widgets/containers/circular_container.dart';
import 'package:blog_app/core/constants/app_colors.dart';
import 'package:blog_app/core/constants/sizes.dart';
import 'package:blog_app/core/constants/styles.dart';
import 'package:flutter/material.dart';


class CustomKeyboard extends StatefulWidget {
  const CustomKeyboard({
    super.key,
    required this.onComplete,
    this.inputLength = 4,
  });
  final Function(String) onComplete;
  final int inputLength;

  @override
  State<CustomKeyboard> createState() => _CustomKeyboardState();
}

class _CustomKeyboardState extends State<CustomKeyboard> {
  String pin = '';

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
    onComplete();
  });
    return Column(
      children: [
        //? filled digits indicators
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              widget.inputLength,
              (i) => CustomCircularContainer(
                margin: const EdgeInsets.symmetric(
                  horizontal: CustomSizes.spaceBtwItems / 2,
                ),
                color: i < pin.length ? AppColors.primary : AppColors.light,
                height: 12,
                width: 12,
              ),
            )
          ],
        ),
        const SizedBox(height: CustomSizes.spaceBtwItems),
        for (int i = 0; i < 3; i++)
          Row(
            children: List.generate(
              3,
              (index) => Expanded(
                child: MaterialButton(
                  onPressed: () {
                    if (pin.length != widget.inputLength) {
                      setState(() {
                        pin += (1 + 3 * i + index).toString();
                      });
                    }
                  },
                  height: 70,
                  shape: const CircleBorder(),
                  child: Text(
                    (1 + 3 * i + index).toString(),
                    style: TextStyles.medium24,
                  ),
                ),
              ),
            ),
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Expanded(child: SizedBox()),
            Expanded(
              child: MaterialButton(
                onPressed: () {
                  if (pin.length != widget.inputLength) {
                    setState(() {
                      pin += "0";
                    });
                  }
                },
                height: 70,
                shape: const CircleBorder(),
                child: Text(
                  "0",
                  style: TextStyles.medium24,
                ),
              ),
            ),
            Expanded(
              child: MaterialButton(
                onPressed: () {
                  setState(() {
                    if (pin != "") {
                      pin = pin.substring(0, pin.length - 1);
                    }
                  });
                },
                height: 70,
                shape: const CircleBorder(),
                child: const Icon(Icons.backspace),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void onComplete() {
    if (pin.length == widget.inputLength) {
      widget.onComplete(pin);
    }
  }
}
