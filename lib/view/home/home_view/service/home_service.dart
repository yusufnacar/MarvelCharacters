import 'package:marvel_chars/view/home/model/home_response_model.dart';
import 'package:marvel_chars/view/home/model/marvel_request_model.dart';

import '../../../../core/constants/enums/http_enum.dart';
import '../../../../core/init/network/i_core_dio.dart';

abstract class IHomeService {
  final ICoreDio? manager;

  IHomeService(this.manager);

  Future<HomeResponseModel?> getCharacters(MarvelRequestModel model);
}

class HomeService extends IHomeService {
  HomeService(ICoreDio? manager) : super(manager);

  @override
  Future<HomeResponseModel?> getCharacters(MarvelRequestModel model) async {
    final response = await manager!.send<HomeResponseModel, HomeResponseModel>(
        "/characters",
        type: HttpTypes.GET,
        parseModel: HomeResponseModel(),
        queryParameters: model.toJson());

    if (response.data is HomeResponseModel) {
      return response.data;
    } else {
      return null;
    }
  }
}
