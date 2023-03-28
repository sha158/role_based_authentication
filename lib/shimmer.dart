import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shimmer/shimmer.dart';

class MyShimmer extends StatelessWidget {
  const MyShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
  direction: ShimmerDirection.rtl,
  gradient: LinearGradient(
    begin: Alignment(-1, -1),
    end: Alignment(1, 1),
    colors: [
      Colors.grey.shade300,
      Colors.grey.shade300,
      Colors.grey.shade300,
    ],
    stops: [0, 0.5, 1],
  ),
  child: ListTile(
    leading: CircleAvatar(
      backgroundColor: Colors.grey[200],
      radius: 25,
    ),
    title: Text('List Item'),
    subtitle: Text('Description'),
    trailing: Icon(Icons.arrow_forward),
  ),
);
;
  }
}