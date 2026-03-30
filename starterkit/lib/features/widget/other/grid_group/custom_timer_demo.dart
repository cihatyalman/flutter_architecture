import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../services/toolkit/custom_timer.dart';
import '../../../../widgets/custom/custom_button.dart';
import '../../../../widgets/project/c_text.dart';

class CustomTimerDemo extends StatelessWidget {
  CustomTimerDemo({super.key});

  final timer = CustomTimer(
    totalDuration: Duration(seconds: 60),
    periotDuration: 100,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        StreamBuilder(
          stream: timer.stream,
          builder: (context, snapshot) {
            final value = snapshot.data;
            final date = DateTime.fromMillisecondsSinceEpoch(
              value?.inMilliseconds ?? 0,
            );
            return CText(
              DateFormat("mm:ss", "tr").format(date),
              isBold: true,
              size: 20,
            );
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              minWidth: 1,
              padding: 8,
              onPressed: () async => timer.start(),
              titleWidget: Icon(
                Icons.play_circle_outline_rounded,
                color: Colors.white,
              ),
            ),
            CustomButton(
              minWidth: 1,
              padding: 8,
              onPressed: () async => timer.playOrPause(),
              titleWidget: StreamBuilder(
                stream: timer.stream,
                builder: (context, snapshot) {
                  return Icon(
                    timer.isActive
                        ? Icons.pause_rounded
                        : Icons.play_arrow_rounded,
                    color: Colors.white,
                  );
                },
              ),
            ),
            CustomButton(
              minWidth: 1,
              padding: 8,
              onPressed: () async => timer.stop(),
              titleWidget: Icon(Icons.stop_rounded, color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}
