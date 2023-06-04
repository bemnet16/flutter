import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/features/auth/model/user_model.dart';
import 'package:bloc_test/features/user/bloc/blocs.dart';
import 'package:bloc_test/features/user/ui/user.dart';
import 'package:bloc_test/features/user/ui/widgets/post_detail.dart';
import 'package:bloc_test/features/user/ui/widgets/saved_history.dart';
import 'package:bloc_test/features/user/ui/widgets/settings.dart';
import 'package:bloc_test/features/user/ui/widgets/user_info.dart';

class MockUserBloc extends Mock implements UserBloc {}

void main() {
  late MockUserBloc mockUserBloc;

  setUp(() {
    mockUserBloc = MockUserBloc();
  });

  group('Profile Widget Test', () {
    testWidgets('Renders the Profile widget with user data',
        (WidgetTester tester) async {
      final mockUser = User(
          id: '123',
          firstName: 'John Doe',
          lastName: 'John Doe',
          userName: 'John Doe',
          email: "bem@gmail.com",
          password: "skljf123424",
          YearOfStudy: 3,
          Program: "software");

      await tester.pumpWidget(
        Profile(),
      );

      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byType(UserInfo), findsOneWidget);
      expect(find.byType(SavedHistory), findsOneWidget);
      expect(find.byType(PostDetail), findsOneWidget);
      expect(find.byType(Setting), findsOneWidget);
    });

    testWidgets('Renders the Profile widget with loading indicator',
        (WidgetTester tester) async {
      when(mockUserBloc.state).thenReturn(UserLoading());

      await tester.pumpWidget(
        Profile(),
      );

      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byType(UserInfo), findsNothing);
      expect(find.byType(SavedHistory), findsNothing);
      expect(find.byType(PostDetail), findsNothing);
      expect(find.byType(Setting), findsNothing);
    });

    testWidgets('Renders the Profile widget with loading failed state',
        (WidgetTester tester) async {
      final errorMessage = 'Failed to load user data';

      when(mockUserBloc.state)
          .thenReturn(UserLoadingFailed(error: errorMessage));

      await tester.pumpWidget(
        Profile(),
      );

      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byType(UserInfo), findsNothing);
      expect(find.byType(SavedHistory), findsNothing);
      expect(find.byType(PostDetail), findsNothing);
      expect(find.byType(Setting), findsNothing);
      expect(find.text(errorMessage), findsOneWidget);
    });
  });
}
