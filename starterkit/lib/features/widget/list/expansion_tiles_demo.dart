import 'package:flutter/material.dart';

import '../../../utils/helpers/widget_helper.dart';
import '../../../widgets/custom/expansion_tiles.dart';
import '../../../widgets/project/c_text.dart';

class ExpansionTilesDemo extends StatelessWidget {
  ExpansionTilesDemo({super.key});

  final items = List.generate(
    5,
    (index) => ExpansionTileData(
      title: "Başlık ${index + 1}",
      // subTitle: "Alt başlık ${index + 1}",
      body: CText("${index + 1} numaralı içerik detayı"),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 500),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CText("ExpansionTiles", isBold: true),
          CText("Açılabilir itemlar oluşturur.", size: 12),
          hw.divider(),
          ExpansionTiles(dataList: items),
        ],
      ),
    );
  }
}
