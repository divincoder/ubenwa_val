import 'package:flutter/material.dart';
import 'package:mum_health/gen/assets.gen.dart';
import 'package:mum_health/generated/l10n.dart';
import 'package:mum_health/ui/common/app_colors.dart';

class LoadingView extends StatefulWidget {
  final VoidCallback onLoadFinished;

  const LoadingView({required this.onLoadFinished, super.key});

  @override
  State<LoadingView> createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late final Animation<AlignmentGeometry> _alignAnimation;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    _controller.addListener(() {
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {_isExpanded = true;});
      });
    });

    _alignAnimation = Tween<AlignmentGeometry>(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );

    Future.delayed(const Duration(milliseconds: 2250), () {
      widget.onLoadFinished();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              S.current.pleaseWaitWhileWeGatherBayData,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  height: 1.4,
                  fontWeight: FontWeight.w400),
            ),
          ),
          AlignTransition(
            alignment: _alignAnimation,
            child: Assets.png.waterDrop.image(height: 35),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Assets.png.babyBottle.image(height: size.height * 0.3),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              width: double.maxFinite,
              height: _isExpanded ? size.height * 2 : size.height * 0.2,
              child: Assets.png.waterPool.image(fit: BoxFit.fill),
            ),
          ),
        ],
      ),
    );
  }
}
