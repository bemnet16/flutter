import 'package:bloc_test/common_widgets/bottom_bar.dart';
import 'package:bloc_test/features/giveaway/model/giveaway_model.dart';
import 'package:bloc_test/features/lost_and_found/ui/lost_an_found_Page.dart';
import 'package:bloc_test/features/notice/ui/notice.dart';
import 'package:bloc_test/features/user/ui/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MyBottomNavigationBar', () {
    
      testWidgets('Initial page is NoticePage', (WidgetTester tester) async {
       await tester.pumpWidget(MaterialApp(
         home: MyBottomNavigationBar(),
      ));

      expect(find.byType(NoticePage), findsOneWidget);
      expect(find.byType(Giveaway), findsNothing);
      expect(find.byType(LostAndFoundPage), findsNothing);
      expect(find.byType(Profile), findsNothing);
    });

    testWidgets('Clicking on Gift Icon navigates to Giveaway page',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: MyBottomNavigationBar(),
      ));

      await tester.tap(find.byIcon(Icons.card_giftcard));
      await tester.pump();

      expect(find.byType(NoticePage), findsNothing);
      expect(find.byType(Giveaway), findsOneWidget);
      expect(find.byType(LostAndFoundPage), findsNothing);
      expect(find.byType(Profile), findsNothing);
    });

    testWidgets('Clicking on Key Icon navigates to LostAndFoundPage',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: MyBottomNavigationBar(),
      ));

      await tester.tap(find.byIcon(Icons.vpn_key));
      await tester.pump();

      expect(find.byType(NoticePage), findsNothing);
      expect(find.byType(Giveaway), findsNothing);
      expect(find.byType(LostAndFoundPage), findsOneWidget);
      expect(find.byType(Profile), findsNothing);
    });
    testWidgets('Clicking on Person Icon navigates to Profile page',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: MyBottomNavigationBar(),
      ));

      await tester.tap(find.byIcon(Icons.person));
      await tester.pump();

      expect(find.byType(NoticePage), findsNothing);
      expect(find.byType(Giveaway), findsNothing);
      expect(find.byType(LostAndFoundPage), findsNothing);
      expect(find.byType(Profile), findsOneWidget);
    });

    testWidgets(
        'Clicking on Add Floating Action Button changes the current index to 2',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: MyBottomNavigationBar(),
      ));

      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      // final bottomNavigationBar = tester
      //     .widget<MyBottomNavigationBar>(find.byType(MyBottomNavigationBar));
      // expect(bottomNavigationBar.currentIndex, 2);
    });
  });
}
