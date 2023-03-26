import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:stocks/model/types/types.dart';

class DbController extends GetxController {
  @override
  void onInit() {
    registerAdapter();
    super.onInit();
  }

  /// Register list of adapters
  registerAdapter() {
    Hive.registerAdapter(TypesHiveAdapter());
  }
}
