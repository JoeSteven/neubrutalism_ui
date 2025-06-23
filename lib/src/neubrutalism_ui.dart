library neubrutalism_ui.src;

import 'package:flutter/material.dart';

export 'widgets/buttons/neu_icon_button.dart';
export 'widgets/buttons/neu_text_button.dart';

//Color
const neuBlack = Colors.black;
const neuDefault1 = Colors.teal;
const neuShadow = Color(0xFF080808);

// Double
const neuBorder = 3.0;
const neuShadowBlurRadius = 0.0;

//others
const neuOffset = Offset(4, 4);
const neuBlurStyle = BlurStyle.solid;

class NeuBrutalismThemeData {
  final Color neuBlack;
  final Color neuDefault1;
  final Color neuShadow;
  final double neuBorder;
  final double neuShadowBlurRadius;
  final Offset neuOffset;
  final BlurStyle neuBlurStyle;

  const NeuBrutalismThemeData({
    this.neuBlack = Colors.black,
    this.neuDefault1 = Colors.teal,
    this.neuShadow = const Color(0xFF080808),
    this.neuBorder = 3.0,
    this.neuShadowBlurRadius = 0.0,
    this.neuOffset = const Offset(4, 4),
    this.neuBlurStyle = BlurStyle.solid,
  });

  NeuBrutalismThemeData copyWith({
    Color? neuBlack,
    Color? neuDefault1,
    Color? neuShadow,
    double? neuBorder,
    double? neuShadowBlurRadius,
    Offset? neuOffset,
    BlurStyle? neuBlurStyle,
  }) {
    return NeuBrutalismThemeData(
      neuBlack: neuBlack ?? this.neuBlack,
      neuDefault1: neuDefault1 ?? this.neuDefault1,
      neuShadow: neuShadow ?? this.neuShadow,
      neuBorder: neuBorder ?? this.neuBorder,
      neuShadowBlurRadius: neuShadowBlurRadius ?? this.neuShadowBlurRadius,
      neuOffset: neuOffset ?? this.neuOffset,
      neuBlurStyle: neuBlurStyle ?? this.neuBlurStyle,
    );
  }
}

class NeuBrutalismTheme extends InheritedWidget {
  final NeuBrutalismThemeData data;
  const NeuBrutalismTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  static NeuBrutalismThemeData of(BuildContext context) {
    final NeuBrutalismTheme? theme =
        context.dependOnInheritedWidgetOfExactType<NeuBrutalismTheme>();
    return theme?.data ?? const NeuBrutalismThemeData();
  }

  @override
  bool updateShouldNotify(NeuBrutalismTheme oldWidget) =>
      data != oldWidget.data;
}
