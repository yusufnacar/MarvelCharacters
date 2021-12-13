import 'package:flutter/material.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/constants/image/image_constants.dart';
import '../../../../core/extension/context_extension.dart';
import '../viewmodel/splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      viewModel: SplashViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, SplashViewModel value) =>
          buildScaffoldBody(context, value),
    );
  }

  Widget buildScaffoldBody(BuildContext context, SplashViewModel viewModel) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: buildSplashImage(context)),
    );
  }

  Widget buildSplashImage(BuildContext context) {
    return Container(
      child: Image.asset(ImageConstants.splashImage),
    );
  }
}

// class SplashView extends StatefulWidget {
//   const SplashView({Key? key}) : super(key: key);

//   @override
//   State<SplashView> createState() => _SplashViewState();
// }

// /// This is the private State class that goes with SplashView.
// /// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
// class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
//   late final AnimationController _controller = AnimationController(
//     duration: const Duration(seconds: 2),
//     vsync: this,
//   )..repeat(reverse: true);
//   late final Animation<double> _animation = CurvedAnimation(
//     parent: _controller,
//     curve: Curves.slowMiddle,
//   );

//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ScaleTransition(
//           scale: _animation,
//           child: Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Image.asset(ApplicationConstants.SPLASH_ASSET_IMG),
//           ),
//         ),
//       ),
//     );
//   }
// }
