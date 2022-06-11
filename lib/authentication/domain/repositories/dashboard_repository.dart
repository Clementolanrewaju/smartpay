import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartpay/authentication/data/models/dashboard_response.dart';
import 'package:smartpay/authentication/domain/services/online/authentication_service.dart';
import 'package:smartpay/core/framework/base_notifier.dart';
import 'package:smartpay/core/framework/convert_functions.dart';


final dashboardRepositoryProvider = Provider((ref) {
  return DashBoardRepository();
});
class DashBoardRepository{
  FutureNotifierState<DashBoardResponse> dashboard() {
   return convert(() => DashBoardService.dashboard());
  }
}