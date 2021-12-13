import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../../view/authenticate/splash/viewmodel/splash_view_model.dart';
import '../../../view/home/details_view/view_model/details_view_model.dart';
import '../../../view/home/home_view/view_model/home_view_model.dart';
import '../navigation/navigation_service.dart';

class ApplicationProvider {
  static ApplicationProvider? _instance;
  static ApplicationProvider get instance {
    _instance ??= ApplicationProvider._init();
    return _instance!;
  }

  ApplicationProvider._init();

  List<SingleChildWidget> singleItems = [];
  List<SingleChildWidget> dependItems = [
    Provider.value(value: NavigationService.instance),
    Provider<HomeViewModel>(
      create: (_) => HomeViewModel(),
    ),
    Provider<DetailsViewModel>(
      create: (_) => DetailsViewModel(),
    ),
    Provider<SplashViewModel>(
      create: (_) => SplashViewModel(),
    )
  ];
  List<SingleChildWidget> uiChangesItems = [];
}
