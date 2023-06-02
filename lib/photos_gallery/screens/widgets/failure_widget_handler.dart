import 'package:flutter/material.dart';

import '../../../core/failures.dart';

class FailurePlaceHolderWidget extends StatelessWidget {
  final Failure? failure;
  const FailurePlaceHolderWidget({super.key, required this.failure});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
