import 'package:flutter/material.dart';
import 'package:hotel_booking/themes/custom_colors.dart';

class FilterButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final IconData icon;
  final Color borderColor;

  const FilterButton({
    super.key,
    required this.onTap,
    required this.title,
    required this.icon,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    // Use Theme data to style the text and set a sensible default size
    TextStyle textStyle = Theme.of(context).textTheme.bodyLarge!.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w500,
    );
    // Calculate the width based on the text length
    double width = _calculateWidth(context, title, textStyle);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor==Colors.transparent ? CColors.textColor(context):CColors.primaryColor(context),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(6)),
        ),
        height: 35,
        width: width,
        margin: const EdgeInsets.symmetric(horizontal: 8), // Added horizontal margin
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12), // Use symmetric padding
          child: Row(
            mainAxisSize: MainAxisSize.min, // Minimize the width of the row
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: textStyle,
              ),
              Icon(icon, size: 16),
            ],
          ),
        ),
      ),
    );
  }

  double _calculateWidth(BuildContext context, String title, TextStyle style) {
    TextPainter painter = TextPainter(
      text: TextSpan(text: title, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    );
    painter.layout();
    double textWidth = painter.width;

    return textWidth + 50;
  }
}
