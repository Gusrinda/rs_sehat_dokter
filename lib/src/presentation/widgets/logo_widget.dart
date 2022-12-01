import 'package:dokter/src/core/assets/assets.gen.dart';
import 'package:flutter/material.dart';

class WhiteLogo extends StatelessWidget {
  const WhiteLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: Assets.logo.logoWithTextWhite.keyName,
        child: Assets.logo.logoWithTextWhite.image(height: 100),
      ),
    );
  }
}

class GreenLogo extends StatelessWidget {
  const GreenLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: Assets.logo.logoWithTextWhite.keyName,
        child: Assets.logo.logoWithTextWhite.image(
          height: 64,
          color: Theme.of(context).primaryColor,
          colorBlendMode: BlendMode.srcIn,
        ),
      ),
    );
  }
}
