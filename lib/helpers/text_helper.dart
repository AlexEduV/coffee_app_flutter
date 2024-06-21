import 'dart:ui' as ui;

import 'package:flutter/material.dart';

bool hasTextOverflow(
    String text,
    TextStyle style,
    double textScaleFactor,
    {double minWidth = 0,
      double maxWidth = double.infinity,
      int maxLines = 2
    }) {
  final TextPainter textPainter = TextPainter(
    text: TextSpan(text: text, style: style),
    maxLines: maxLines,
    textDirection: ui.TextDirection.ltr,
    textScaleFactor: textScaleFactor,
  )..layout(minWidth: minWidth, maxWidth: maxWidth);

  return textPainter.didExceedMaxLines;
}
