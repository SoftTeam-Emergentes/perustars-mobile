import 'dart:collection';

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

class DependencyInjectionProvider {
  static final DependencyInjectionProvider _instance = DependencyInjectionProvider._internal();
  factory DependencyInjectionProvider.instance() {
    return _instance;
  }
  T injectInstance<T>() {
    if(_dependencyMap.containsKey(T) == false) {
      throw ArgumentError("Type $T is not registered");
    }
    return _dependencyMap[T];
  }

  final Map<Type, dynamic> _dependencyMap = HashMap<Type, dynamic>();

  void _configureServiceMap() {
    /* Art Events Dependencies Inyections */
    _dependencyMap[ArtEventInterface] = ArtEventRepository();
    _dependencyMap[ArtEventFacadeService] = ArtEventFacadeService(
      artEventInterface: _dependencyMap[ArtEventInterface] as ArtEventInterface
    );
    _dependencyMap[ArtEventListBloc] = ArtEventListBloc(
      artEventFacadeService: _dependencyMap[ArtEventFacadeService] as ArtEventFacadeService
    );
    _dependencyMap[ArtEventSharedService] = ArtEventSharedService();

    /* Notifications Dependencies Inyections */
    _dependencyMap[NotificationRemoteDataProvider] = NotificationRemoteDataProvider();
    _dependencyMap[NotificationInterface] = NotificationRepository(
      notificationRemoteDataProvider: _dependencyMap[NotificationRemoteDataProvider] as NotificationRemoteDataProvider
    );
    _dependencyMap[NotificationFacadeService] = NotificationFacadeService(
      notificationRepository: _dependencyMap[NotificationInterface] as NotificationInterface
    );
    _dependencyMap[NotificationListBloc] = NotificationListBloc(
      notificationFacadeService: _dependencyMap[NotificationFacadeService] as NotificationFacadeService
    );

  }

  DependencyInjectionProvider._internal() {
    _configureServiceMap();
  }
}