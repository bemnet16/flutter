import 'package:bloc_test/features/giveaway/bloc/giveaway_bloc.dart';
import 'package:bloc_test/features/giveaway/model/giveaway_model.dart';
import 'package:bloc_test/features/giveaway/repository/giveaway_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';

// Create a mock GiveawayRepository
class MockGiveawayRepository extends Mock implements GiveawayRepository {}

void main() {
  late GiveawayBloc giveawayBloc;
  late MockGiveawayRepository mockGiveawayRepository;

  setUp(() {
    mockGiveawayRepository = MockGiveawayRepository();
    giveawayBloc = GiveawayBloc(giveawayRepository: mockGiveawayRepository);
  });

  tearDown(() {
    giveawayBloc.close();
  });

  group('GiveawayBloc', () {
    // Test the initial state
    test('initial state should be GiveawayState', () {
      expect(giveawayBloc.state, isA<GiveawayState>());
    });

    // Test the FetchGiveawayEvent
    group('FetchGiveawayEvent', () {
      const page = 1;
      const filter = {'category': 'electronics'};

      test('emits [GiveawayState(isLoading: true), GiveawayState]', () async {
        final expectedStates = [
          GiveawayState(isLoading: true),
          GiveawayState(isLoading: false, giveaways: []),
        ];

        when(mockGiveawayRepository.fetchAll(page, filter))
            .thenAnswer((_) async => []);

        expectLater(giveawayBloc.stream, emitsInOrder(expectedStates));

        giveawayBloc.add(FetchGiveawayEvent(page: page, filter: filter));
      });

      test('emits [GiveawayState(isLoading: true), GiveawayState]', () {
        final giveaways = [
          Giveaway(
            id: '1',
            title: 'Giveaway 1',
            description: 'Description 1',
            category: 'Electronics',
            condition: 'New',
            imageUrl: 'https://example.com/image1.jpg',
            userId: '123',
            userName: 'John Doe',
            isAvailable: true,
          ),
          Giveaway(
            id: '2',
            title: 'Giveaway 2',
            description: 'Description 2',
            category: 'Books',
            condition: 'Used',
            imageUrl: 'https://example.com/image2.jpg',
            userId: '456',
            userName: 'Jane Smith',
            isAvailable: true,
          ),
        ];

        final expectedStates = [
          GiveawayState(isLoading: true),
          GiveawayState(isLoading: false, giveaways: giveaways),
        ];

        when(mockGiveawayRepository.fetchAll(page, filter))
            .thenAnswer((_) async => giveaways);

        expectLater(giveawayBloc.stream, emitsInOrder(expectedStates));

        giveawayBloc.add(FetchGiveawayEvent(page: page, filter: filter));
      });
    });

    group('CreateGiveawayEvent', () {
      const giveaway = Giveaway(
        title: 'New Giveaway',
        description: 'Description',
        category: 'Electronics',
        condition: 'New',
        userId: '123',
        userName: 'John Doe',
        isAvailable: true,
      );

      test('emits [GiveawayState(isLoading: true), GiveawayState]', () {
        final expectedStates = [
          GiveawayState(isLoading: true),
          GiveawayState(isLoading: false, giveaways: [giveaway]),
        ];

        when(mockGiveawayRepository.create(giveaway))
            .thenAnswer((_) async => giveaway);

        expectLater(giveawayBloc.stream, emitsInOrder(expectedStates));

        giveawayBloc.add(CreateGiveawayEvent(giveaway: giveaway));
      });
    });

    group('EditGiveawayEvent', () {
      const giveaway = Giveaway(
        id: '1',
        title: 'Updated Giveaway',
        description: 'Updated Description',
        category: 'Electronics',
        condition: 'Used',
        userId: '123',
        userName: 'John Doe',
        isAvailable: true,
      );

      test('emits [GiveawayState(isLoading: true), GiveawayState]', () {
        final initialGiveaways = [
          Giveaway(
            id: '1',
            title: 'Giveaway 1',
            description: 'Description 1',
            category: 'Electronics',
            condition: 'New',
            imageUrl: 'https://example.com/image1.jpg',
            userId: '123',
            userName: 'John Doe',
            isAvailable: true,
          ),
        ];

        final expectedStates = [
          GiveawayState(isLoading: true),
          GiveawayState(isLoading: false, giveaways: [giveaway]),
        ];

        when(mockGiveawayRepository.update(giveaway))
            .thenAnswer((_) async => giveaway);

        giveawayBloc.emit(GiveawayState(giveaways: initialGiveaways));
        expectLater(giveawayBloc.stream, emitsInOrder(expectedStates));

        giveawayBloc.add(EditGiveawayEvent(giveaway: giveaway));
      });
    });

    group('DeleteGiveawayEvent', () {
      const giveaway = Giveaway(
        id: '1',
        title: 'Giveaway 1',
        description: 'Description 1',
        category: 'Electronics',
        condition: 'New',
        imageUrl: 'https://example.com/image1.jpg',
        userId: '123',
        userName: 'John Doe',
        isAvailable: true,
      );

      test('emits [GiveawayState(isLoading: true), GiveawayState]', () {
        final initialGiveaways = [giveaway];

        final expectedStates = [
          GiveawayState(isLoading: true),
          GiveawayState(isLoading: false, giveaways: []),
        ];

        when(mockGiveawayRepository.delete(giveaway)).thenAnswer((_) async {});

        giveawayBloc.emit(GiveawayState(giveaways: initialGiveaways));
        expectLater(giveawayBloc.stream, emitsInOrder(expectedStates));

        giveawayBloc.add(DeleteGiveawayEvent(giveaway: giveaway));
      });
    });
  });
}
