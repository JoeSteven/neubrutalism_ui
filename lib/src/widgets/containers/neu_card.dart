// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:neubrutalism_ui/neubrutalism_ui.dart';

class NeuCard extends StatefulWidget {
  /// A customizable neubrutalist-style Image-Container.
  ///
  /// The Container has a child, customizable background color, border color,
  /// and drop shadow. The button's shape can also be customized with a rounded
  /// border radius. The button's behavior is specified with an `onPressed`
  /// callback function.
  ///
  /// This button is built using Flutter's `Material` widget, and is designed to
  /// follow the Neubrutalism UI style guidelines.
  ///
  /// *[Constants]

  ///   - const neuBlack = Colors.black;
  ///   - const neuDefault1 = Colors.teal;
  ///   - const neuShadow = Color(0xFF080808);
  ///
  ///   - const neuBorder = 3.0;
  ///   - const neuShadowBlurRadius = 0.0;
  ///
  ///   - const neuOffset = Offset(4, 4);
  ///   - const neuBlurStyle = BlurStyle.solid;
  ///
  ///
  ///
  NeuCard({
    Key? key,
    this.offset = neuOffset,
    this.cardColor,
    this.shadowColor = neuShadow,
    this.cardBorderColor = neuBlack,
    this.imageBorderColor = neuBlack,
    this.paddingData,
    this.cardHeight,
    this.cardWidth,
    this.cardBorderWidth = neuBorder,
    this.shadowBlurRadius = neuShadowBlurRadius,
    this.imageBorderWidth = neuBorder,
    this.shadowBlurStyle = neuBlurStyle,
    this.child,
    this.borderRadius,
  }) : super(key: key);

  /// - offset : An Offset that defines the amount and direction of the blur applied to the shadow of the card.
  ///
  final Offset offset;

  /// - cardColor (optional) : A Color that defines the background color of the card.
  ///
  /// By default, it is set to neuDefault1.
  final Color? cardColor;

  /// - shadowColor (optional) : A Color that defines the color of the card's shadow.
  ///
  /// By default, it is set to neuShadow.
  ///
  final Color shadowColor;

  /// - cardBorderColor (optional) : A Color that defines the color of the border of the card.
  ///
  /// By default, it is set to neuBlack
  final Color cardBorderColor;

  /// - imageBorderColor (optional) : A Color that defines the color of the border of the image inside the card.
  ///
  /// By default, it is set to neuBlack.
  final Color imageBorderColor;

  /// - paddingData (optional) : An EdgeInsetsGeometry that defines the padding for the contents of the card.
  final EdgeInsets? paddingData;

  /// - cardHeight (optional) : A double that defines the height of the card.
  ///
  ///
  final double? cardHeight;

  /// - cardWidth (optional) : A double that defines the width of the card.
  ///
  final double? cardWidth;

  /// - cardBorderWidth (optional) : A double that defines the width of the border of the card.
  ///
  ///  By default, it is set to neuBorder.
  final double cardBorderWidth;

  /// - shadowBlurRadius (optional) : A double that defines the radius of the blur applied to the shadow of the card.
  ///
  /// By default, it is set to neuShadowBlurRadius.
  ///
  final double shadowBlurRadius;

  /// - imageBorderWidth (optional) : A double that defines the width of the border of the image inside the card.
  ///
  /// By default, it is set to 1.0.
  ///
  final double imageBorderWidth;

  /// - shadowBlurStyle (optional) : A BlurStyle that defines the style of the blur applied to the shadow of the card.
  ///
  /// By default, it is set to BlurStyle.normal.
  final BlurStyle shadowBlurStyle;

  /// - child (optional) : A widget that is displayed inside the card.
  final Widget? child;

  /// - borderRadius(optional): A BorderRadius parameter helpful for twerking the Card Shape
  ///
  final BorderRadiusGeometry? borderRadius;

  @override
  State<NeuCard> createState() => NeuCardState();
}

class NeuCardState extends State<NeuCard> {
  @override
  Widget build(BuildContext context) {
    final theme = NeuBrutalismTheme.of(context);
    final Offset offset =
        widget.offset == neuOffset ? theme.neuOffset : widget.offset;
    final Color cardColor =
        widget.cardColor == null || widget.cardColor == neuDefault1
            ? theme.neuDefault1
            : widget.cardColor!;
    final Color shadowColor =
        widget.shadowColor == neuShadow ? theme.neuShadow : widget.shadowColor;
    final Color cardBorderColor = widget.cardBorderColor == neuBlack
        ? theme.neuBlack
        : widget.cardBorderColor;
    final Color imageBorderColor = widget.imageBorderColor == neuBlack
        ? theme.neuBlack
        : widget.imageBorderColor;
    final double cardBorderWidth = widget.cardBorderWidth == neuBorder
        ? theme.neuBorder
        : widget.cardBorderWidth;
    final double shadowBlurRadius =
        widget.shadowBlurRadius == neuShadowBlurRadius
            ? theme.neuShadowBlurRadius
            : widget.shadowBlurRadius;
    final double imageBorderWidth = widget.imageBorderWidth == neuBorder
        ? theme.neuBorder
        : widget.imageBorderWidth;
    final BlurStyle shadowBlurStyle = widget.shadowBlurStyle == neuBlurStyle
        ? theme.neuBlurStyle
        : widget.shadowBlurStyle;
    return Container(
        width: widget.cardWidth,
        height: widget.cardHeight,
        decoration: BoxDecoration(
          borderRadius: widget.borderRadius,
          border: Border.all(
            color: cardBorderColor,
            width: cardBorderWidth,
          ),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              blurRadius: shadowBlurRadius,
              offset: offset,
              blurStyle: shadowBlurStyle,
            ),
          ],
          color: cardColor,
        ),
        padding: widget.paddingData,
        child: widget.child);
  }
}
