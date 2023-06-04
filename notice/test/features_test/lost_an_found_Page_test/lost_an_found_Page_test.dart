import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/features/lost_and_found/bloc/lost_and_found_bloc.dart';
import 'package:bloc_test/features/lost_and_found/bloc/lost_and_found_event.dart';
import 'package:bloc_test/features/lost_and_found/bloc/lost_and_found_state.dart';
import 'package:bloc_test/features/lost_and_found/ui/lost_an_found_Page.dart';

class MockLostAndFoundBloc extends Mock implements LostAndFoundBloc {}

void main() {
  late LostAndFoundBloc lostAndFoundBloc;

  setUp(() {
    lostAndFoundBloc = MockLostAndFoundBloc();
  });

  testWidgets('LostAndFoundPage widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<LostAndFoundBloc>.value(
          value: lostAndFoundBloc,
          child: LostAndFoundPage(),
        ),
      ),
    );

    when(lostAndFoundBloc.state).thenReturn(LoadingState());
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    verify(lostAndFoundBloc.add(FetchLostOrFoundEvent(index: 0, page: 1)));

    await tester.tap(find.text('FOUND'));
    await tester.pumpAndSettle();

    verify(lostAndFoundBloc.add(FetchLostOrFoundEvent(index: 1, page: 1)));

    await tester.tap(find.text('LOST'));
    await tester.pumpAndSettle();

    verify(lostAndFoundBloc.add(FetchLostOrFoundEvent(index: 0, page: 1)));

    await tester.pumpWidget(Container());
  });
}
