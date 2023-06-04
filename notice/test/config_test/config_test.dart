import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../lib/features/auth/bloc/auth_bloc.dart';
import '../../lib/features/auth/repository/auth_repository.dart';
import '../../lib/features/giveaway/bloc/giveaway_bloc.dart';
import '../../lib/features/giveaway/repository/giveaway_repository.dart';
import '../../lib/features/giveaway_detail/bloc/giveaway_detail_bloc.dart';
import '../../lib/features/giveaway_detail/repository/giveaway_detail_repository.dart';
import '../../lib/features/lost_and_found/bloc/lost_and_found_bloc.dart';
import '../../lib/features/lost_and_found/repository/lost_and_found_repository.dart';
import '../../lib/features/notice/bloc/notice_bloc.dart';
import '../../lib/features/notice/repository/notice_repository.dart';
import '../../lib/features/user/bloc/user_bloc.dart';
import '../../lib/features/user/repository/user_repository.dart';
import '../../lib/config/config.dart';

void main() {
  group('App Configuration', () {
    testWidgets('App initializes with proper configuration',
        (WidgetTester tester) async {
      await tester.pumpWidget(config());

      expect(find.byType(GiveawayRepository), findsOneWidget);
      expect(find.byType(GiveawayDetailRepository), findsOneWidget);
      expect(find.byType(LostAndFoundRepository), findsOneWidget);
      expect(find.byType(NoticeRepository), findsOneWidget);
      expect(find.byType(UserRepository), findsOneWidget);
      expect(find.byType(AuthRepository), findsOneWidget);

      expect(find.byType(GiveawayBloc), findsOneWidget);
      expect(find.byType(GiveawayDetailBloc), findsOneWidget);
      expect(find.byType(UserBloc), findsOneWidget);
      expect(find.byType(AuthBloc), findsOneWidget);
      expect(find.byType(LostAndFoundBloc), findsOneWidget);
      expect(find.byType(NoticeBloc), findsOneWidget);

      expect(find.byType(MaterialApp), findsOneWidget);
      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(materialApp.debugShowCheckedModeBanner, false);
    });
  });
}
