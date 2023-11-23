import 'package:get_it/get_it.dart';
import 'package:peru_stars_mobile/art_event_management/application/art_event_facade_service.dart';
import 'package:peru_stars_mobile/art_event_management/domain/interfaces/art_event_interface.dart';
import 'package:peru_stars_mobile/art_event_management/infrastructure/respositories/art_event_repository.dart';
import 'package:peru_stars_mobile/art_event_management/presentation/art_events_list/bloc/bloc.dart';
import 'package:peru_stars_mobile/art_event_management/presentation/services/art_event_shared_service.dart';
import 'package:peru_stars_mobile/notification_management/application/notification_facade_service.dart';
import 'package:peru_stars_mobile/notification_management/domain/interfaces/notification_interface.dart';
import 'package:peru_stars_mobile/notification_management/infrastructure/data_sources/notification_remote_data_provider.dart';
import 'package:peru_stars_mobile/notification_management/infrastructure/repositories/notification_repository.dart';
import 'package:peru_stars_mobile/notification_management/presentation/notification_list/bloc/notification_list_bloc.dart';

GetIt getIt = GetIt.instance;
void setupGetIt() {
  // Art Events Dependencies Inyections
  getIt.registerLazySingleton<ArtEventInterface>(() => ArtEventRepository());
  getIt.registerLazySingleton<ArtEventFacadeService>(() => ArtEventFacadeService(
    artEventInterface: getIt<ArtEventInterface>(),
  ));
  getIt.registerFactory<ArtEventListBloc>(() => ArtEventListBloc(
    artEventFacadeService: getIt<ArtEventFacadeService>(),
  ));
  getIt.registerLazySingleton<ArtEventSharedService>(() => ArtEventSharedService());

  // Notifications Dependencies Inyections
  getIt.registerLazySingleton<NotificationRemoteDataProvider>(() => NotificationRemoteDataProvider());
  getIt.registerLazySingleton<NotificationInterface>(() => NotificationRepository(
    notificationRemoteDataProvider: getIt<NotificationRemoteDataProvider>(),
  ));
  getIt.registerLazySingleton<NotificationFacadeService>(() => NotificationFacadeService(
    notificationRepository: getIt<NotificationInterface>(),
  ));
  getIt.registerFactory<NotificationListBloc>(() => NotificationListBloc(
    notificationFacadeService: getIt<NotificationFacadeService>(),
  ));
}