import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../lithium_http_inspector.dart';
import '../../data/http_interface.dart';
import 'item_tile.dart';

class ScreenBody extends StatelessWidget {
  final LithiumHttpInspector lithium;

  const ScreenBody({super.key, required this.lithium});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<HttpResponseInterface>?>(
      future: lithium.find(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return ItemTile(
                response: snapshot.data![index],
              );
            },
            itemCount: snapshot.data?.length,
          );
        }

        return const Center(
          child: Text('Data is empty'),
        );
      },
    );
  }
}
