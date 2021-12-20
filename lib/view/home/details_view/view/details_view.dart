import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marvel_chars/core/constants/image/image_constants.dart';
import 'package:marvel_chars/core/extension/context_extension.dart';
import 'package:marvel_chars/view/components/marvel_appbar.dart';

import 'package:marvel_chars/view/home/details_view/view_model/details_view_model.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../components/marvel_card.dart';

class DetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScrollController controller = ScrollController();
    return Consumer(builder: (context, DetailsViewModel viewModel, _) {
      return BaseView<DetailsViewModel>(
          viewModel: viewModel,
          onModelReady: (model) {
            model.setContext(context);
            model.init();
          },
          onPageBuilder: (BuildContext context, viewModel) => Scaffold(
                appBar: MarvelAppBar(),
                body: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: context.paddingLow,
                        child: Text(
                          viewModel.name,
                          style: context.textTheme.headline6,
                        ),
                      ),
                      Container(
                        child: Image.network(viewModel.url),
                        width: context.width * 0.75,
                        height: context.height * 0.4,
                      ),
                      Container(
                        padding: context.paddingLow,
                        child: Text(
                          viewModel.description,
                          style: context.textTheme.headline6,
                        ),
                      ),
                      Observer(builder: (_) {
                        if (viewModel.isLoading) {
                          return buildCircularProgress();
                        } else {
                          return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: viewModel.results!.length,
                            itemBuilder: (context, index) {
                              if (viewModel.results != null) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      viewModel.results![index].title!,
                                      style: context.textTheme.bodyText1,
                                    ),
                                    width: context.width * 0.5,
                                    height: context.height * 0.05,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                );
                              } else {
                                return Text("");
                              }
                            },
                          );
                        }
                      })
                    ],
                  ),
                ),
              ));
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
