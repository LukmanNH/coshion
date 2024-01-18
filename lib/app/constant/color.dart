// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const colorPrimary = Color(0xFF0E8388);
const colorSecondary = Color(0xFF2E4F4F);

const WHITE_PRIMARY = Colors.white;
const BLACK_PRIMARY = Colors.black;

const TEXT_PRIMARY = Color(0xFF0D0E0F);
const TEXT_SECONDARY = Color(0xFF91919F);

final textStylePrimaryOnBoard = GoogleFonts.playfairDisplay(
  fontWeight: FontWeight.bold,
  color: const Color(0xFF2C3333),
  fontSize: 24,
);

const textStyleSecondaryOnBoard = TextStyle(
  fontWeight: FontWeight.w400,
  color: Color(0xFF2E4F4F),
  fontSize: 14,
  height: 2,
  letterSpacing: 0.42,
);

const textStylePrimary = TextStyle(
  fontFamily: "Satoshi",
  color: Color(0xFF2C3333),
  fontSize: 14,
  fontWeight: FontWeight.bold,
);

const textStyleSecondary = TextStyle(
  fontFamily: "Satoshi",
  color: Color(0xFF2E4F4F),
  fontSize: 12,
  fontWeight: FontWeight.w500,
);
