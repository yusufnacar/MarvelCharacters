import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/constants/app/app_constant.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../core/init/network/network_manager.dart';
import '../../model/home_response_model.dart';
import '../../model/marvel_request_model.dart';
import '../../model/marvel_results.dart';
import '../service/home_service.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store, BaseViewModel {
  ScrollController scrollController = ScrollController();

  ObservableList<MarvelResults> chars = ObservableList<MarvelResults>();
  late IHomeService homeService;

  int offset = 0;
  late int index;

  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    homeService = HomeService(NetworkManager.instance!.coreDio);
    getMarvelCharacters();
    offset += 30;

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        scrollListener();
      }
    });
  }

  @observable
  bool isLoading = false;

  @observable
  HomeResponseModel? response;

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @action
  Future<void> getMarvelCharacters() async {
    changeLoading();
    response = await homeService.getCharacters(MarvelRequestModel(
        limit: 30,
        offset: offset,
        apikey: ApplicationConstants.API_KEY,
        hash: ApplicationConstants.HASH,
        orderBy: "-modified",
        ts: ApplicationConstants.TS));

    if (response != null) {
      chars.addAll(response!.data!.results);
    }
    changeLoading();
  }

  @action
  Future<void> scrollListener() async {
    await getMarvelCharacters();
    offset += 30;
  }

  void navigateToDetailsPage() {
    navigation.navigateToPage(path: NavigationConstants.DETAILS);
  }
}
