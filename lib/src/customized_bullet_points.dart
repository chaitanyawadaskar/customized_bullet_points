import 'package:flutter/material.dart';
import 'constant.dart';
import 'gap.dart';

class CustomizedBulletPoints extends StatelessWidget {
  final List<dynamic> items;
  final BulletStyle style;
  final double? gap;
  final TextStyle? textStyle;
  final double? iconSize;
  final Color? iconColor;
  final CrossAxisAlignment? crossAxisAlignment;
  final Widget? customBullet;
  const CustomizedBulletPoints({
    super.key,
    required this.items,
    this.style = BulletStyle.dot,
    this.gap,
    this.textStyle,
    this.iconSize,
    this.iconColor,
    this.crossAxisAlignment,
    this.customBullet,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...List.generate(items.length, (index) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customBullet ?? resolveBulletType(index),
              Gap.horizontal(gap ?? 15),
              Flexible(
                child: items[index] is String
                    ? Text(
                        items[index],
                        style: textStyle,
                      )
                    : items[index] is Widget
                        ? items[index]
                        : const SizedBox.shrink(),
              ),
            ],
          );
        })
      ],
    );
  }

  Widget resolveBulletType(int index) {
    switch (style) {
      case BulletStyle.none:
        return const SizedBox.shrink();
      case BulletStyle.dot:
        return Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Icon(Icons.circle, size: iconSize ?? 10.0, color: iconColor),
        );
      case BulletStyle.dash:
        return Text('-', style: textStyle);
      case BulletStyle.numeric:
        return Text('${index + 1}.', style: textStyle);
      default:
        return const SizedBox.shrink();
    }
  }
}
