import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:spoonacular/src/config/route/app_routes.dart';
import 'package:spoonacular/src/core/util/assets_constants.dart';
import 'package:spoonacular/src/core/util/routes_constants.dart';
import 'package:spoonacular/src/di.dart';

void main() async {
  await dotenv.load(fileName: AssetsConstants.envFileRoot);
  final Di di = Di();
  di.injectDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesConstants.splashScreenRoute,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
