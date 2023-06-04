import 'package:bloc_test/features/lost_and_found/data_provider/found_local_database_provider.dart';
import 'package:bloc_test/features/lost_and_found/data_provider/lost_local_database_data_provider.dart';
import 'package:bloc_test/features/notice/data_provider/local_database_provider.dart';
import 'package:bloc_test/routes/app_route_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../features/auth/bloc/auth_bloc.dart';
import '../features/auth/data_provider/auth_data_provider.dart';
import '../features/auth/repository/auth_repository.dart';
import '../features/giveaway/bloc/giveaway_bloc.dart';
import '../features/giveaway/data_provider/giveaway_data_provider.dart';
import '../features/giveaway/data_provider/local_databse_provider.dart';
import '../features/giveaway/repository/giveaway_repository.dart';
import '../features/giveaway_detail/bloc/giveaway_detail_bloc.dart';
import '../features/giveaway_detail/data_provider/giveaway_detail_data_provider.dart';
import '../features/giveaway_detail/repository/giveaway_detail_repository.dart';
import '../features/lost_and_found/bloc/lost_and_found_bloc.dart';
import '../features/lost_and_found/data_provider/lost_and_found_data_provider.dart';
import '../features/lost_and_found/repository/lost_and_found_repository.dart';
import '../features/notice/bloc/notice_bloc.dart';
import '../features/notice/data_provider/notice_data_provider.dart';
import '../features/notice/repository/notice_repository.dart';
import '../features/user/bloc/user_bloc.dart';
import '../features/user/data_provider/user_data_provider.dart';
import '../features/user/repository/user_repository.dart';

MultiRepositoryProvider config() {
  return MultiRepositoryProvider(
    providers: [
      RepositoryProvider<GiveawayRepository>(
        create: (context) => GiveawayRepository(GiveawayDataProvider(),GiveawayDatabaseProvider()),
      ),
      RepositoryProvider<GiveawayDetailRepository>(
        create: (context) =>
            GiveawayDetailRepository(GiveawayDataDetailProvider()),
      ),
      RepositoryProvider<LostAndFoundRepository>(
        create: (context) => LostAndFoundRepository(LostAndFoundDataProvider(),LostDatabaseProvider(),FoundDatabaseProvider()),
      ),
      RepositoryProvider<NoticeRepository>(
        create: (context) => NoticeRepository(NoticeDataProvider(),DatabaseProvider()),
      ),
      RepositoryProvider<UserRepository>(
        create: (context) => UserRepository(UserDataProvider()),
      ),
      RepositoryProvider<AuthRepository>(
        create: (context) => AuthRepository(AuthDataProvider()),
      ),
    ],
    child: MultiBlocProvider(
      providers: [
        BlocProvider<GiveawayBloc>(create: (context) {
          return GiveawayBloc(
              giveawayRepository: GiveawayRepository(GiveawayDataProvider(),GiveawayDatabaseProvider()));
        }),
        BlocProvider<GiveawayDetailBloc>(create: (context) {
          return GiveawayDetailBloc(
              giveawayDetailRepository:
                  GiveawayDetailRepository(GiveawayDataDetailProvider()), giveawayDatabaseProvider: GiveawayDatabaseProvider());
        }),
        BlocProvider<UserBloc>(create: (context) {
          return UserBloc(userRepository: UserRepository(UserDataProvider()));
        }),
        BlocProvider<AuthBloc>(create: (context) {
          return AuthBloc(authRepository: AuthRepository(AuthDataProvider()));
        }),
        BlocProvider<LostAndFoundBloc>(create: (context) {
          return LostAndFoundBloc(
            lostAndFoundRepository:
                LostAndFoundRepository(LostAndFoundDataProvider(),LostDatabaseProvider(),FoundDatabaseProvider()),
          );
        }),
        BlocProvider<NoticeBloc>(create: (context) {
          return NoticeBloc(
              noticeRepository: NoticeRepository(NoticeDataProvider(),DatabaseProvider()),
              authBloc:
                  AuthBloc(authRepository: AuthRepository(AuthDataProvider())));
        }),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routeInformationParser:
            NyAppRouter.returnRouter().routeInformationParser,
        routerDelegate: NyAppRouter.returnRouter().routerDelegate,
      ),
    ),
  );
}
