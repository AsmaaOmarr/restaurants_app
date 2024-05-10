import 'package:flutter/material.dart';

import 'package:mobile_assignment_1/features/map/widgets/map_view_body.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MapViewBody(),
    );
  }
}
