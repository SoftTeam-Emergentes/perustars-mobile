import 'dart:collection';

import 'package:peru_stars_mobile/art_event_management/application/art_event_facade_service.dart';
import 'package:peru_stars_mobile/art_event_management/domain/interfaces/art_event_interface.dart';
import 'package:peru_stars_mobile/art_event_management/infrastructure/respositories/art_event_repository.dart';
import 'package:peru_stars_mobile/art_event_management/presentation/art_events_list/bloc/bloc.dart';
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
    if(_serviceMap.containsKey(T) == false) {
      throw ArgumentError("Type $T is not registered");
    }
    return _serviceMap[T];
  }

  final Map<Type, dynamic> _serviceMap = HashMap<Type, dynamic>();

  void _configureServiceMap() {
    /* Art Events Dependencies Inyections */
    _serviceMap[ArtEventInterface] = ArtEventRepository();
    _serviceMap[ArtEventFacadeService] = ArtEventFacadeService();
    _serviceMap[ArtEventListBloc] = ArtEventListBloc(
      artEventFacadeService: _serviceMap[ArtEventFacadeService] as ArtEventFacadeService
    );

    /* Notifications Dependencies Inyections */
    _serviceMap[NotificationRemoteDataProvider] = NotificationRemoteDataProvider();
    _serviceMap[NotificationInterface] = NotificationRepository(
      notificationRemoteDataProvider: _serviceMap[NotificationRemoteDataProvider] as NotificationRemoteDataProvider
    );
    _serviceMap[NotificationFacadeService] = NotificationFacadeService(
      notificationRepository: _serviceMap[NotificationInterface] as NotificationInterface
    );
    _serviceMap[NotificationListBloc] = NotificationListBloc(
      notificationFacadeService: _serviceMap[NotificationFacadeService] as NotificationFacadeService
    );

  }

  DependencyInjectionProvider._internal() {
    _configureServiceMap();
  }
}