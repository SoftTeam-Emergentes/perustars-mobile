import 'package:peru_stars_mobile/profile/domain/interfaces/HobbyistInterface.dart';
import 'package:peru_stars_mobile/profile/infrastructure/data_source/hobbyist_remote_data_provider.dart';
import 'package:peru_stars_mobile/profile/infrastructure/models/hobbyist_model.dart';

class HobbyistRepository implements HobbyistInterface{
  late final HobbyistDataProvider _hobbyistDataProvider;
  HobbyistRepository(){
    _hobbyistDataProvider=HobbyistDataProvider();
  }

  @override
  Future createHobbyist(int userId, int age) {
    HobbyistModel model=HobbyistModel(id:0, userId: userId, age: age);
    Future response=_hobbyistDataProvider.createHobbyist(model);
    return response;
  }

  @override
  Future deleteHobbyistById(int id) {
    Future response= _hobbyistDataProvider.deleteHobbyistById(id);
    return response;
  }

  @override
  Future editHobbyistId(int id) {
    throw UnimplementedError();
  }

  @override
  Future getHobbyistById(int id) {
    Future response= _hobbyistDataProvider.getHobbyistById(id);
    return response;
  }


}