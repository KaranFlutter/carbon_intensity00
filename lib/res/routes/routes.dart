import 'package:carbon_intensity_project/res/routes/routes_name.dart';
import 'package:carbon_intensity_project/view/main_screen/main_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RoutesName.mainScreen,
            page: () => MainScreen(),
            transition: Transition.leftToRightWithFade),
      ];
}
