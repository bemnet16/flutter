import 'package:bloc_test/features/giveaway_detail/bloc/giveaway_detail_bloc.dart';
import 'package:bloc_test/features/giveaway_detail/bloc/giveaway_detail_event.dart';
import 'package:bloc_test/features/giveaway_detail/bloc/giveaway_detail_state.dart';
import 'package:bloc_test/features/giveaway_detail/models/essay_model.dart';
import 'package:bloc_test/features/giveaway_detail/ui/detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';


class MockGiveawayDetailBloc extends Mock implements GiveawayDetailBloc {}

void main() {
  late GiveawayDetailBloc giveawayDetailBloc;

  setUp(() {
    giveawayDetailBloc = MockGiveawayDetailBloc();
  });

  testWidgets('GiveawayDetailPage widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<GiveawayDetailBloc>.value(
          value: giveawayDetailBloc,
          child: GiveawayDetailPage(id: 'your_id'),
        ),
      ),
    );

    when(giveawayDetailBloc.state).thenReturn(
      GiveawayDetailState(
        isLoading: false,
        essays: [],
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsNothing);

    expect(find.byType(AppBar), findsOneWidget);

    expect(find.byIcon(Icons.arrow_back), findsOneWidget);

    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pump();

    expect(find.byIcon(Icons.share), findsOneWidget);

    await tester.tap(find.byIcon(Icons.share));
    await tester.pump();

    expect(find.text('Giveaway title'), findsOneWidget);

    expect(find.text('Comment Section'), findsOneWidget);

    await tester.tap(find.text('Comment Section'));
    await tester.pump();

    verify(giveawayDetailBloc.add(FetchGiveawayEssay(id: 'your_id')));

    expect(find.text('Essay content'), findsOneWidget);

    expect(find.byType(TextField), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'Comment text');

    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    verify(giveawayDetailBloc.add(CreateEssay(
        essay: Essay(
            userName: '',
            giveAwayItemId: '345y',
            userId: 'your_id',
            content: 'Comment text'))));

    expect(find.byType(Icon), findsNWidgets(9));
  });
}
