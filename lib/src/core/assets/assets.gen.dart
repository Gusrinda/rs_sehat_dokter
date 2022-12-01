/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  $AssetsIconsHomeGen get home => const $AssetsIconsHomeGen();
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/doctor-avatar.webp
  AssetGenImage get doctorAvatar =>
      const AssetGenImage('assets/images/doctor-avatar.webp');

  /// File path: assets/images/doctor-full.webp
  AssetGenImage get doctorFull =>
      const AssetGenImage('assets/images/doctor-full.webp');

  /// File path: assets/images/doctor-photo.webp
  AssetGenImage get doctorPhoto =>
      const AssetGenImage('assets/images/doctor-photo.webp');

  /// File path: assets/images/email-verification.webp
  AssetGenImage get emailVerification =>
      const AssetGenImage('assets/images/email-verification.webp');

  /// File path: assets/images/new-appointment.webp
  AssetGenImage get newAppointment =>
      const AssetGenImage('assets/images/new-appointment.webp');

  /// File path: assets/images/schedule-illustrations.webp
  AssetGenImage get scheduleIllustrations =>
      const AssetGenImage('assets/images/schedule-illustrations.webp');

  /// File path: assets/images/vector-card.webp
  AssetGenImage get vectorCard =>
      const AssetGenImage('assets/images/vector-card.webp');
}

class $AssetsLogoGen {
  const $AssetsLogoGen();

  /// File path: assets/logo/logo-white.webp
  AssetGenImage get logoWhite =>
      const AssetGenImage('assets/logo/logo-white.webp');

  /// File path: assets/logo/logo-with-text-white.webp
  AssetGenImage get logoWithTextWhite =>
      const AssetGenImage('assets/logo/logo-with-text-white.webp');

  /// File path: assets/logo/logo_kanjuruhan.png
  AssetGenImage get logoKanjuruhan =>
      const AssetGenImage('assets/logo/logo_kanjuruhan.png');
}

class $AssetsIconsHomeGen {
  const $AssetsIconsHomeGen();

  /// File path: assets/icons/home/daftar-antrian.webp
  AssetGenImage get daftarAntrian =>
      const AssetGenImage('assets/icons/home/daftar-antrian.webp');

  /// File path: assets/icons/home/jadwal-dokter.webp
  AssetGenImage get jadwalDokter =>
      const AssetGenImage('assets/icons/home/jadwal-dokter.webp');

  /// File path: assets/icons/home/konsultasi.webp
  AssetGenImage get konsultasi =>
      const AssetGenImage('assets/icons/home/konsultasi.webp');

  /// File path: assets/icons/home/pesan-obat.webp
  AssetGenImage get pesanObat =>
      const AssetGenImage('assets/icons/home/pesan-obat.webp');

  /// File path: assets/icons/home/rekam-medik.webp
  AssetGenImage get rekamMedik =>
      const AssetGenImage('assets/icons/home/rekam-medik.webp');

  /// File path: assets/icons/home/rujukan.webp
  AssetGenImage get rujukan =>
      const AssetGenImage('assets/icons/home/rujukan.webp');

  /// File path: assets/icons/home/transaksi.webp
  AssetGenImage get transaksi =>
      const AssetGenImage('assets/icons/home/transaksi.webp');
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLogoGen logo = $AssetsLogoGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
