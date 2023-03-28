import 'package:fin_infocom/views/homepage.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ListTileShimmer extends StatelessWidget {
  const ListTileShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

     
    
    return Shimmer(
      gradient: LinearGradient(
        begin: Alignment(-1, -1),
        end: Alignment(1, 1),
        colors: [
          Colors.grey[300]!,
          Colors.grey[200]!,
          Colors.grey[300]!,
        ],
        stops: [0, 0.5, 1],
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.grey[200]!,
          radius: 25,
        ),
        title: Container(
          height: 12,
          width: double.infinity,
          color: Colors.grey[200],
        ),
        subtitle: Container(
          height: 10,
          width: double.infinity,
          color: Colors.grey[200],
        ),
        trailing: Icon(Icons.arrow_forward),
      ),
    );
  }
}
