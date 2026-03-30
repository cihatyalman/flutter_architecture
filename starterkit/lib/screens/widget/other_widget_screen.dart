import 'package:flutter/material.dart';

import '../../features/widget/exports.dart';
import '../../widgets/project/c_appbar.dart';
import '../../widgets/project/c_text.dart';

class OtherWidgetScreen extends StatelessWidget {
  static const route = 'OtherWidgetScreen';

  const OtherWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAppbar(title: "Diğer Widgetlar").build(context),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(12).copyWith(bottom: 0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              delegate: SliverChildListDelegate([
                gridWidget(title: "CustomMenu", child: CustomMenuDemo()),
                gridWidget(
                  title: "CustomFutureWidget",
                  child: CustomFutureWidgetDemo(),
                ),
                gridWidget(
                  title: "FullScreenLoading",
                  child: FullScreenLoadingDemo(),
                ),
                gridWidget(title: "OverlayDialog", child: OverlayDialogDemo()),
                gridWidget(
                  title: "CustomBottomSheet",
                  child: CustomBottomSheetDemo(),
                ),
                gridWidget(title: "CustomPopup", child: CustomPopupDemo()),
                gridWidget(
                  title: "CustomAnimator",
                  child: CustomAnimatorDemo(),
                ),
                gridWidget(title: "CustomTimer", child: CustomTimerDemo()),
              ]),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(12).copyWith(bottom: 56),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                divider(),
                titleWidget("Local Bildirimler"),
                CustomNotifyDemo(),
                divider(),
                titleWidget("CustomFillWidget"),
                CustomFillWidgetDemo(),
                divider(),
                titleWidget("Blur"),
                BlurWidgetDemo(),
                divider(),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget titleWidget(String title) => CText(title, isBold: true, size: 20);
  Widget divider() => Divider(color: Colors.black12);

  Widget gridWidget({required String title, required Widget child}) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        spacing: 8,
        children: [
          Expanded(child: Center(child: child)),
          CText(title),
        ],
      ),
    );
  }
}
