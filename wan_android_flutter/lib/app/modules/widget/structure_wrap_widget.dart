import 'package:flutter/material.dart';
import 'package:flutter_wan_android/app/modules/entity/structure_entity.dart';

/// 自定义体系和导航的Item组件
class TreeWrap extends StatelessWidget {
  final String? title;

  final List<StructureEntity>? items;
  final Function(StructureEntity item, int index)? onItemTrap;

  const TreeWrap(
      {super.key, required this.title, required this.items, this.onItemTrap});

  @override
  Widget build(BuildContext context) {
    var data = items;
    if (data != null && data.isNotEmpty && title != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title!,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.start,
            children: buildItems(data),
          ),
        ],
      );
    }
    return const SizedBox.shrink();
  }

  buildItems(List<StructureEntity> data) {
    return data
        .map(
          (e) => OutlinedButton(
            style: OutlinedButton.styleFrom(
                textStyle: const TextStyle(fontSize: 13)),
            onPressed: () {
              onItemTrap?.call(e, data.indexOf(e));
            },
            child: Text(e.name ?? ""),
          ),
        )
        .toList();
  }
}
