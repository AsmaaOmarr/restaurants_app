import 'package:flutter/material.dart';

class ResturantItem extends StatelessWidget {
  const ResturantItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.amber,
        child: const Center(child: Text('Resturant Item')),
      ),
    );
  }
}
