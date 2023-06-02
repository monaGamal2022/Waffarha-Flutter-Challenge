import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingShimmerWidget extends StatelessWidget {
  const LoadingShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black12,
      highlightColor: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: const [
            Text('PPPPPPPPPPPPPPPP'),
            Text('PPPPPPPPPPPPPPPP'),
            Text('PPPPPPPPPPPPPPPP'),
          ],
        ),
      ),
    );
  }
}
