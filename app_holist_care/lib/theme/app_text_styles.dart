import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_theme.dart';

abstract class AppTextStyles {
  TextStyle get button;
  TextStyle get title;
  TextStyle get titleImages;
  TextStyle get titleContainers;
  TextStyle get titlePontos;
  TextStyle get titleNome;
  TextStyle get titleImageNaoEncontrada;
  TextStyle get textoSairApp;
  TextStyle get textoCadastroSucesso;
  TextStyle get textoTermo;
  TextStyle get textoSuccessoNFT;
}

class AppTextStylesDefault implements AppTextStyles {
  @override
  TextStyle get button => GoogleFonts.montserrat(
      fontSize: 14, color: AppTheme.colors.button, fontWeight: FontWeight.w600);

  @override
  TextStyle get title => GoogleFonts.montserrat(
      fontSize: 40,
      color: AppTheme.colors.primary,
      fontWeight: FontWeight.w700);

  @override
  TextStyle get titleImages => GoogleFonts.montserrat(
      fontSize: 12,
      color: AppTheme.colors.titleImages,
      fontWeight: FontWeight.w700);

  @override
  TextStyle get titleContainers => GoogleFonts.montserrat(
      fontSize: 20,
      color: AppTheme.colors.titleImages,
      fontWeight: FontWeight.w700);

  @override
  TextStyle get titlePontos => GoogleFonts.montserrat(
      fontSize: 40,
      color: AppTheme.colors.primary,
      fontWeight: FontWeight.w700);

  @override
  TextStyle get titleNome => GoogleFonts.montserrat(
      fontSize: 14,
      color: AppTheme.colors.primary,
      fontWeight: FontWeight.w700);

  @override
  TextStyle get titleImageNaoEncontrada => GoogleFonts.montserrat(
      fontSize: 12, color: Colors.black, fontWeight: FontWeight.w700);

  @override
  TextStyle get textoSairApp => GoogleFonts.montserrat(
      fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500);

  @override
  TextStyle get textoCadastroSucesso => GoogleFonts.montserrat(
      fontSize: 14, color: Colors.white, fontWeight: FontWeight.w700);

  @override
  TextStyle get textoTermo =>
      GoogleFonts.montserrat(fontSize: 14, color: Colors.black);

  @override
  TextStyle get textoSuccessoNFT => GoogleFonts.montserrat(
      fontSize: 24, color: AppTheme.colors.button, fontWeight: FontWeight.w600);
}
