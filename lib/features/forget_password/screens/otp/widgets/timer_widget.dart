import 'dart:async';

import 'package:blog_app/core/constants/sizes.dart';
import 'package:blog_app/core/constants/styles.dart';
import 'package:blog_app/core/helpers/extensions.dart';
import 'package:blog_app/features/forget_password/logic/forget_password_cubit.dart';
import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  static const maxSeconds = 60;
  int remainingSeconds = maxSeconds;
  Timer? timer;

  void startTimer() {
    timer?.cancel(); // Cancel any existing timer
    remainingSeconds = maxSeconds;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingSeconds > 0) {
          remainingSeconds--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  void resetTimer() {
    setState(() {
      timer?.cancel();
      remainingSeconds = maxSeconds;
    });
  }

  @override
  void dispose() {
    timer?.cancel(); // Cancel the timer if the widget is disposed
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          //? remaining time
          if (remainingSeconds != 0)
            Text(
              "00:${remainingSeconds.toString().padLeft(2, "0")} ${'Sec'.tr}",
              style: TextStyles.medium14,
            ),
          const SizedBox(height: CustomSizes.spaceBtwItems),
          //? resend the otp
          if (remainingSeconds == 0)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't receive code ?".tr,
                  style: TextStyles.regular14,
                ),
                TextButton(
                  onPressed: timer!.isActive
                      ? null
                      : () {
                          startTimer();
                          final cubit = ForgetPasswordCubit.get(context); //? resend otp again
                          cubit.checkEmail(email: cubit.email);
                        },
                  child: Text(
                    "Re-send".tr,
                    style: TextStyles.semibold14,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
