import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';

class BaseRoundedTopBody extends StatelessWidget {
  const BaseRoundedTopBody({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ColumnSuper(
        innerDistance: -16,
        children: [
          Container(height: 16, color: Theme.of(context).primaryColor),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: Colors.white,
            ),
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: child,
          ),
        ],
      ),
    );
  }
}
