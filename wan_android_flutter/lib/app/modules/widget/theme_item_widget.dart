import 'package:convert/convert.dart';
import 'package:flutter/material.dart';

import 'paths_paint.dart';

/// List item.
class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.icon,
    this.iconPaths,
    this.trailing,
    this.onTap,
    this.selectBgColor,
    this.selected = false,
    this.divider = false,
  });

  final String title;

  final String? subtitle;

  final Widget? leading;

  final IconData? icon;

  final List<String>? iconPaths;

  final Widget? trailing;

  final bool selected;

  final Color? selectBgColor;

  final VoidCallback? onTap;

  final bool divider;

  Widget? get _leading {
    if (leading != null) {
      return leading!;
    }
    if (icon != null) {
      return Container(
        height: 36,
        width: 36,
        decoration: BoxDecoration(
          color: ColorUtils.backgroundColorWithString(title),
          borderRadius: const BorderRadius.all(Radius.circular(18)),
        ),
        alignment: Alignment.center,
        child: Icon(
          icon!,
          color: ColorUtils.foregroundColorWithString(title),
        ),
      );
    }
    if (iconPaths != null) {
      return Container(
        height: 36,
        width: 36,
        decoration: BoxDecoration(
          color: ColorUtils.backgroundColorWithString(title),
          borderRadius: const BorderRadius.all(Radius.circular(18)),
        ),
        alignment: Alignment.center,
        child: PathsPaint(
          paths: iconPaths!,
          colors: List.filled(
              iconPaths!.length, ColorUtils.foregroundColorWithString(title)),
          width: 24,
        ),
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          selectedTileColor: selectBgColor,
          title: Text(title),
          subtitle: subtitle == null ? null : Text(subtitle!),
          leading: _leading,
          trailing: trailing,
          selected: selected,
          onTap: onTap,
        ),
        if (divider)
          Padding(
            padding: EdgeInsets.only(
                left: leading == null && icon == null ? 16 : 72, right: 16),
            child: const Divider(
              thickness: 1,
              height: 1,
            ),
          ),
      ],
    );
  }
}

class ColorUtils {
  /// Generate background color from string.
  static Color backgroundColorWithString(String value) {
    final strHex =
        hex.encode('${value}color'.codeUnits.map((e) => e % 256).toList());
    String colorStr = '';
    const hexLength = 6;
    final spacing = strHex.length ~/ hexLength;
    for (int i = 0; i < hexLength; i++) {
      colorStr += String.fromCharCode(strHex.codeUnitAt(i * spacing + 1));
    }
    return Color(int.parse('ff$colorStr', radix: 16));
  }

  /// Generate foreground color from string.
  static Color foregroundColorWithString(String value) {
    final bgColor = backgroundColorWithString(value);
    return bgColor.red * 0.299 + bgColor.green * 0.587 + bgColor.blue * 0.114 >
            186
        ? Colors.black
        : Colors.white;
  }
}
