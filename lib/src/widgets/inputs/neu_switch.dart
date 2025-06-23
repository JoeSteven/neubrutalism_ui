import 'package:flutter/material.dart';
import 'package:neubrutalism_ui/neubrutalism_ui.dart';

class NeuSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final bool isEnabled;
  final double width;
  final double height;
  final Widget? label;
  final Color activeColor;
  final Color inactiveColor;
  final Color thumbColor;
  final Color borderColor;
  final Color shadowColor;
  final double borderRadius;
  final double borderWidth;
  final double shadowBlurRadius;
  final Offset shadowOffset;

  const NeuSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
    this.isEnabled = true,
    this.width = 48.0,
    this.height = 28.0,
    this.label,
    this.activeColor = neuDefault1,
    this.inactiveColor = Colors.white,
    this.thumbColor = neuBlack,
    this.borderColor = neuBlack,
    this.shadowColor = neuShadow,
    this.borderRadius = 16.0,
    this.borderWidth = neuBorder,
    this.shadowBlurRadius = 4.0,
    this.shadowOffset = const Offset(2, 2),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = NeuBrutalismTheme.of(context);
    final Color activeColor =
        this.activeColor == neuDefault1 ? theme.neuDefault1 : this.activeColor;
    final Color thumbColor =
        this.thumbColor == neuBlack ? theme.neuBlack : this.thumbColor;
    final Color borderColor =
        this.borderColor == neuBlack ? theme.neuBlack : this.borderColor;
    final Color shadowColor =
        this.shadowColor == neuShadow ? theme.neuShadow : this.shadowColor;
    final double borderWidth =
        this.borderWidth == neuBorder ? theme.neuBorder : this.borderWidth;
    final double shadowBlurRadius = this.shadowBlurRadius == 4.0
        ? theme.neuShadowBlurRadius
        : this.shadowBlurRadius;
    final Offset shadowOffset =
        this.shadowOffset == neuOffset ? theme.neuOffset : this.shadowOffset;
    final double borderRadius =
        this.borderRadius == 16.0 ? 16.0 : this.borderRadius;
    final effectiveTrackColor = isEnabled
        ? (value ? activeColor : inactiveColor)
        : Colors.grey.shade300;
    final effectiveBorderColor = isEnabled ? borderColor : Colors.grey.shade400;
    final effectiveShadowColor = isEnabled ? shadowColor : Colors.grey.shade400;
    final double thumbSize = height - borderWidth * 2 - 4;
    return GestureDetector(
      onTap: isEnabled && onChanged != null ? () => onChanged!(!value) : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          NeuContainer(
            width: width,
            height: height,
            color: effectiveTrackColor,
            borderColor: effectiveBorderColor,
            borderWidth: borderWidth,
            shadowColor: effectiveShadowColor,
            shadowBlurRadius: shadowBlurRadius,
            offset: shadowOffset,
            borderRadius: BorderRadius.circular(borderRadius),
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedAlign(
                  alignment:
                      value ? Alignment.centerRight : Alignment.centerLeft,
                  duration: Duration(milliseconds: 180),
                  curve: Curves.ease,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    child: NeuContainer(
                      width: thumbSize,
                      height: thumbSize,
                      color: thumbColor,
                      borderColor: effectiveBorderColor,
                      borderWidth: borderWidth,
                      shadowColor: Colors.transparent,
                      shadowBlurRadius: 0.0,
                      offset: Offset.zero,
                      borderRadius: BorderRadius.circular(thumbSize / 2),
                    ),
                  ),
                ),
              ],
            ),
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
