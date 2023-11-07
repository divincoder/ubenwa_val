/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsPngGen {
  const $AssetsPngGen();

  /// File path: assets/png/baby.png
  AssetGenImage get baby => const AssetGenImage('assets/png/baby.png');

  /// File path: assets/png/baby_bottle.png
  AssetGenImage get babyBottle =>
      const AssetGenImage('assets/png/baby_bottle.png');

  /// File path: assets/png/baby_four.png
  AssetGenImage get babyFour => const AssetGenImage('assets/png/baby_four.png');

  /// File path: assets/png/baby_one.png
  AssetGenImage get babyOne => const AssetGenImage('assets/png/baby_one.png');

  /// File path: assets/png/baby_three.png
  AssetGenImage get babyThree =>
      const AssetGenImage('assets/png/baby_three.png');

  /// File path: assets/png/baby_two.png
  AssetGenImage get babyTwo => const AssetGenImage('assets/png/baby_two.png');

  /// File path: assets/png/mum_four.png
  AssetGenImage get mumFour => const AssetGenImage('assets/png/mum_four.png');

  /// File path: assets/png/mum_one.png
  AssetGenImage get mumOne => const AssetGenImage('assets/png/mum_one.png');

  /// File path: assets/png/mum_three.png
  AssetGenImage get mumThree => const AssetGenImage('assets/png/mum_three.png');

  /// File path: assets/png/mum_two.png
  AssetGenImage get mumTwo => const AssetGenImage('assets/png/mum_two.png');

  /// File path: assets/png/pie_chart.png
  AssetGenImage get pieChart => const AssetGenImage('assets/png/pie_chart.png');

  /// File path: assets/png/water_drop.png
  AssetGenImage get waterDrop =>
      const AssetGenImage('assets/png/water_drop.png');

  /// File path: assets/png/water_pool.png
  AssetGenImage get waterPool =>
      const AssetGenImage('assets/png/water_pool.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        baby,
        babyBottle,
        babyFour,
        babyOne,
        babyThree,
        babyTwo,
        mumFour,
        mumOne,
        mumThree,
        mumTwo,
        pieChart,
        waterDrop,
        waterPool
      ];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/app_icon.svg
  SvgGenImage get appIcon => const SvgGenImage('assets/svg/app_icon.svg');

  /// File path: assets/svg/app_icon_text.svg
  SvgGenImage get appIconText =>
      const SvgGenImage('assets/svg/app_icon_text.svg');

  /// File path: assets/svg/arrow_left.svg
  SvgGenImage get arrowLeft => const SvgGenImage('assets/svg/arrow_left.svg');

  /// File path: assets/svg/chart.svg
  SvgGenImage get chart => const SvgGenImage('assets/svg/chart.svg');

  /// File path: assets/svg/daily_challenge.svg
  SvgGenImage get dailyChallenge =>
      const SvgGenImage('assets/svg/daily_challenge.svg');

  /// File path: assets/svg/notification_outline.svg
  SvgGenImage get notificationOutline =>
      const SvgGenImage('assets/svg/notification_outline.svg');

  /// File path: assets/svg/star.svg
  SvgGenImage get star => const SvgGenImage('assets/svg/star.svg');

  /// File path: assets/svg/sun_fog.svg
  SvgGenImage get sunFog => const SvgGenImage('assets/svg/sun_fog.svg');

  /// File path: assets/svg/wifi_square.svg
  SvgGenImage get wifiSquare => const SvgGenImage('assets/svg/wifi_square.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        appIcon,
        appIconText,
        arrowLeft,
        chart,
        dailyChallenge,
        notificationOutline,
        star,
        sunFog,
        wifiSquare
      ];
}

class Assets {
  Assets._();

  static const $AssetsPngGen png = $AssetsPngGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
