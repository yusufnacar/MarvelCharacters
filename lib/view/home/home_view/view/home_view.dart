import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marvel_chars/core/constants/image/image_constants.dart';
import 'package:marvel_chars/view/components/marvel_appbar.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../components/marvel_card.dart';
import '../view_model/home_view_model.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, HomeViewModel viewModel, _) {
      return BaseView<HomeViewModel>(
          viewModel: viewModel,
          onModelReady: (model) {
            model.setContext(context);
            model.init();
          },
          onPageBuilder: (BuildContext context, viewModel) => Scaffold(
              appBar: MarvelAppBar(),
              body: Observer(builder: (_) {
                if (viewModel.isLoading && viewModel.chars.isEmpty) {
                  return buildCircularProgress();
                } else {
                  return ListView.builder(
                    itemCount: viewModel.chars.length,
                    controller: viewModel.scrollController,
                    itemBuilder: (context, index) {
                      if (index == viewModel.chars.length - 1) {
                        return buildCircularProgress();
                      }

                      return GestureDetector(
                        child: MarvelCard(
                          chars: viewModel.chars[index],
                        ),
                        onTap: () {
                          viewModel.index = index;
                          viewModel.navigateToDetailsPage();
                        },
                      );
                    },
                  );
                }
              })));
    });
  }

  Center buildCircularProgress() {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.black,
      ),
    );
  }
}
