import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/features/giveaway/bloc/giveaway_bloc.dart';
import 'package:bloc_test/features/giveaway/ui/widgets/card.dart';

class MockGiveawayBloc extends Mock implements GiveawayBloc {}

void main() {
  late GiveawayBloc giveawayBloc;

  setUp(() {
    giveawayBloc = MockGiveawayBloc();
  });

  testWidgets('Giveaway widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<GiveawayBloc>.value(
          value: giveawayBloc,
          child: Container(),
        ),
      ),
    );

    when(giveawayBloc.state).thenReturn(
      GiveawayState(
        isLoading: false,
        giveaways: [],
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsNothing);

    expect(find.byType(TextField), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'Search query');

    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    verify(giveawayBloc.add(
        FetchGiveawayEvent(page: 1, filter: {"category": "Search query"})));

    expect(find.byType(CardWidget), findsOneWidget);
  });
}
