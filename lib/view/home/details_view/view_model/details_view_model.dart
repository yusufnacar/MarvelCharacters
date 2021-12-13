import 'package:flutter/material.dart';
import 'package:marvel_chars/core/constants/app/app_constant.dart';
import 'package:marvel_chars/core/init/network/network_manager.dart';

import 'package:marvel_chars/view/home/details_view/service/details_service.dart';
import 'package:marvel_chars/view/home/model/marvel_request_model.dart';
import 'package:marvel_chars/view/home/model/marvel_results.dart';

import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../model/home_response_model.dart';
import '../../home_view/view_model/home_view_model.dart';

part 'details_view_model.g.dart';

class DetailsViewModel = _DetailsViewModelBase with _$DetailsViewModel;

abstract class _DetailsViewModelBase with Store, BaseViewModel {
  int offset = 0;
  late String name;
  late String url;
  late String description;
  late int charID;

  late IDetailService detailService;

  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    detailService = DetailService(NetworkManager.instance!.coreDio);
    getNameUrl();
    getComics();
  }

  @observable
  bool isLoading = false;

  @observable
  HomeResponseModel? response;

  @observable
  List<MarvelResults>? results;

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @action
  Future<void> getComics() async {
    changeLoading();
    response = await detailService.getComics(
        MarvelRequestModel(
          limit: 10,
          apikey: ApplicationConstants.API_KEY,
          hash: ApplicationConstants.HASH,
          orderBy: "-onsaleDate",
          ts: ApplicationConstants.TS,
        ),
        charID);

    if (response != null) {
      results = response!.data!.results;
    }

    changeLoading();
  }

  void getNameUrl() {
    var provider = Provider.of<HomeViewModel>(context!, listen: false);
    name = provider.chars[provider.index].name!;
    url = provider.chars[provider.index].thumbnail.thumbnailPic;
    description = provider.chars[provider.index].description!;
    charID = provider.chars[provider.index].id!;
  }
}
