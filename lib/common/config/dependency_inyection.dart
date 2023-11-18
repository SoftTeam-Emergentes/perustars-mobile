import 'dart:collection';

import 'package:peru_stars_mobile/art_event_management/application/art_event_facade_service.dart';
import 'package:peru_stars_mobile/art_event_management/presentation/art_events_list/bloc/bloc.dart';

class DependencyInjectionProvider {
  static final DependencyInjectionProvider _instance = DependencyInjectionProvider._internal();
  factory DependencyInjectionProvider.instance() {
    return _instance;
  }
  T injectInstance<T>() {
    if(serviceMap.containsKey(T) == false) {
      throw ArgumentError("Type $T is not registered");
    }
    return serviceMap[T];
  }

  final Map<Type, dynamic> serviceMap = HashMap<Type, dynamic>();

  void _configureServiceMap() {
    serviceMap[ArtEventFacadeService] = ArtEventFacadeService();
    serviceMap[ArtEventListBloc] = ArtEventListBloc(
      artEventFacadeService: serviceMap[ArtEventFacadeService] as ArtEventFacadeService
    );
  }

  DependencyInjectionProvider._internal() {
    _configureServiceMap();
  }
}