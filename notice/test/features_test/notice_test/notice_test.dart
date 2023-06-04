import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/features/notice/bloc/notice_bloc.dart';
import 'package:bloc_test/features/notice/model/notice_model.dart';
import 'package:bloc_test/features/notice/ui/notice.dart';
import 'package:bloc_test/features/notice/ui/widgets/card.dart';

class MockNoticeBloc extends Mock implements NoticeBloc {}

void main() {
  late MockNoticeBloc mockNoticeBloc;

  setUp(() {
    mockNoticeBloc = MockNoticeBloc();
  });

  group('NoticePage Widget Test', () {
    testWidgets('Renders the NoticePage with notices',
        (WidgetTester tester) async {
      final mockNotices = [
        const Notice(
        author: "author 1",
          title: 'Notice 1',
          content: 'This is notice 1',
          visibility: "",
          typeOfProgram: "software",
          userId: "userId",
          year: '2',
          imgUrl: 'https://example.com/notice1.jpg',
          department: 'Department A',
        ),
        const Notice(
          author: "author 2",
          title: 'Notice 2',
          content: 'This is notice 2',
    
          typeOfProgram: "software",
          userId: "userId",
          year: '2',
          imgUrl: 'https://example.com/notice1.jpg',
          department: 'Department A', visibility: '',
        ),
      ];

      await tester.pumpWidget(
        NoticePage(
          key: Key('noticePage'),
        ),
      );

      expect(find.byKey(Key('noticePage')), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byIcon(Icons.menu), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byType(CustomCard), findsNWidgets(mockNotices.length));
    });
  });
}
