import 'package:flutter/material.dart';
import 'package:neubrutalism_ui/neubrutalism_ui.dart';

class NeuCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final bool isEnabled;
  final double size;
  final Widget? label;
  final Color activeColor;
  final Color checkColor;
  final Color borderColor;
  final Color shadowColor;
  final double borderRadius;
  final double borderWidth;
  final double shadowBlurRadius;
  final Offset shadowOffset;

  const NeuCheckbox({
    Key? key,
    required this.value,
    required this.onChanged,
    this.isEnabled = true,
    this.size = 24.0,
    this.label,
    this.activeColor = neuDefault1,
    this.checkColor = Colors.white,
    this.borderColor = neuBlack,
    this.shadowColor = neuShadow,
    this.borderRadius = 8.0,
    this.borderWidth = neuBorder,
    this.shadowBlurRadius = 4.0,
    this.shadowOffset = const Offset(2, 2),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = NeuBrutalismTheme.of(context);
    final Color activeColor =
        this.activeColor == neuDefault1 ? theme.neuDefault1 : this.activeColor;
    final Color borderColor =
        this.borderColor == neuBlack ? theme.neuBlack : this.borderColor;
    final Color shadowColor =
        this.shadowColor == neuShadow ? theme.neuShadow : this.shadowColor;
    final double borderWidth =
        this.borderWidth == neuBorder ? theme.neuBorder : this.borderWidth;
    final double shadowBlurRadius = this.shadowBlurRadius == neuShadowBlurRadius
        ? theme.neuShadowBlurRadius
        : this.shadowBlurRadius;
    final Offset shadowOffset =
        this.shadowOffset == neuOffset ? theme.neuOffset : this.shadowOffset;
    final double borderRadius =
        this.borderRadius == 8.0 ? 8.0 : this.borderRadius;
    final effectiveColor = isEnabled ? activeColor : Colors.grey.shade300;
    final effectiveBorderColor = isEnabled ? borderColor : Colors.grey.shade400;
    final effectiveShadowColor = isEnabled ? shadowColor : Colors.grey.shade400;
    return GestureDetector(
      onTap: isEnabled && onChanged != null ? () => onChanged!(!value) : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          NeuContainer(
            width: size,
            height: size,
            color: value ? effectiveColor : Colors.white,
            borderColor: effectiveBorderColor,
            borderWidth: borderWidth,
            shadowColor: effectiveShadowColor,
            shadowBlurRadius: shadowBlurRadius,
            offset: shadowOffset,
            borderRadius: BorderRadius.circular(borderRadius),
            child: value
                ? Center(
                    child: Icon(
                      Icons.check,
                      size: size * 0.7,
                      color: checkColor,
                      weight: 800,
                    ),
                  )
                : null,
          ),
          if (label != null) ...[
            SizedBox(width: 8),
            label!,
          ]
        ],
      ),
    );
  }
}
