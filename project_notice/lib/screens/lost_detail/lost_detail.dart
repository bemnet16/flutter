import 'package:flutter/material.dart';
import 'package:project_notice/screens/lost_detail/widgets/contact_info.dart';
import 'package:project_notice/screens/lost_detail/widgets/description.dart';

import 'widgets/custom_app_bar.dart';

class LostDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [CustomAppBar(), const ContactInfo(), Description()],
        ),
      ),
    );
  }
}
