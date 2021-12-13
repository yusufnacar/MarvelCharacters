import '../../../../core/constants/enums/http_enum.dart';
import '../../../../core/init/network/i_core_dio.dart';
import '../../model/home_response_model.dart';
import '../../model/marvel_request_model.dart';

abstract class IDetailService {
  final ICoreDio? manager;

  IDetailService(this.manager);

  Future<HomeResponseModel?> getComics(MarvelRequestModel model, int charId);
}

class DetailService extends IDetailService {
  DetailService(ICoreDio? manager) : super(manager);

  @override
  Future<HomeResponseModel?> getComics(
      MarvelRequestModel model, int charId) async {
    final response = await manager!.send<HomeResponseModel, HomeResponseModel>(
        "/characters/$charId/comics?dateRange=2005-01-01,2022-01-01&format=comic",
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
