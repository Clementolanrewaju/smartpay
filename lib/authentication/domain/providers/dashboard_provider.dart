import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartpay/authentication/data/models/dashboard_response.dart';
import 'package:smartpay/authentication/domain/repositories/dashboard_repository.dart';
import 'package:smartpay/authentication/views/password_recovery/verification_Page.dart';
import 'package:smartpay/core/navigation/navigator.dart';
import 'package:smartpay/shared/helpers/extensions/buildcontext_extension.dart';

final dashBoardProvider = Provider((ref) {
  final repo = ref.read(dashboardRepositoryProvider);
  return DashboardProvider(repo);
});

class DashboardProvider {
  final DashBoardRepository _repo;

  DashboardProvider(this._repo);

  Future <void> dashboard(
   BuildContext context,
      ) async {
    const model = DashBoardResponse;
    final state = await _repo.dashboard();
    // showDialog(
    //   context: context,
    //   barrierDismissible: false,
    //   builder: (_) =>  Dialog(
    //     backgroundColor: Colors.black.withOpacity(0.5),
    //     insetPadding: EdgeInsets.zero,
    //     child: SizedBox(
    //         width: double.maxFinite,
    //         height: double.maxFinite,
    //         child:  CircularProgressIndicator()
    //     ),
    //   ),
    // );
    if (state.isDone) {
      final r = state.data!;
      if (r.status=true) {
        pushTo(context, VerificationPage());
        return;
      }
    } else {
      print(state.message);
      context.showError(state.message!);
    }
  }
}
