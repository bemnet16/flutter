import 'package:flutter/material.dart';

import 'widgets/contact_info.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/description.dart';

class LostDetailPage extends StatelessWidget {
  final data;
  const LostDetailPage({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               CustomAppBar(data:data),
              ContactInfo(data:data),
             Description(data:data)],
          ),
        ),
      ),
    );
  }
}
