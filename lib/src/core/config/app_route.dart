import 'package:dokter/src/presentation/blocs/auth/login/login_bloc.dart';
import 'package:dokter/src/presentation/splash_view.dart';
import 'package:dokter/src/presentation/views/auth/change_password_view.dart';
import 'package:dokter/src/presentation/views/auth/forgot_password_view.dart';
import 'package:dokter/src/presentation/views/auth/login_view.dart';
import 'package:dokter/src/presentation/views/auth/reset_password_view.dart';
import 'package:dokter/src/presentation/views/consultation/chat_detail_view.dart';
import 'package:dokter/src/presentation/views/consultation/online_consultation_view.dart';
import 'package:dokter/src/presentation/views/home/home_view.dart';
import 'package:dokter/src/presentation/views/medical_record/medical_record_detail_view.dart';
import 'package:dokter/src/presentation/views/medical_record/medical_record_form.dart';
import 'package:dokter/src/presentation/views/medical_record/medical_record_list.dart';
import 'package:dokter/src/presentation/views/profile/edit/personal_data_view.dart';
import 'package:dokter/src/presentation/views/profile/edit/personal_data_view2.dart';
import 'package:dokter/src/presentation/views/profile/profile_view.dart';
import 'package:dokter/src/presentation/views/queue/queue_list_view.dart';
import 'package:dokter/src/presentation/views/resep/resep_detail_view.dart';
import 'package:dokter/src/presentation/views/resep/resep_form_view.dart';
import 'package:dokter/src/presentation/views/rujukan/rujukan_detail_view.dart';
import 'package:dokter/src/presentation/views/rujukan/rujukan_form_view.dart';
import 'package:dokter/src/presentation/views/schedule/schedule_add_form.dart';
import 'package:dokter/src/presentation/views/schedule/schedule_detail_view.dart';
import 'package:dokter/src/presentation/views/schedule/schedule_edit_form.dart';
import 'package:dokter/src/presentation/views/schedule/schedule_listview.dart';
import 'package:dokter/src/presentation/views/settings/settings_controller.dart';
import 'package:dokter/src/presentation/views/settings/settings_view.dart';
import 'package:dokter/src/presentation/views/transaction/chat_transaction_view.dart';
import 'package:dokter/src/presentation/views/transaction/history_transaction_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoute {
  const AppRoute._();

  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    late WidgetBuilder builder;
    bool fullscreenDialog = false;

    switch (routeSettings.name) {
      case SettingsView.routeName:
        builder = (context) =>
            SettingsView(controller: context.read<SettingsController>());
        break;
      case LoginView.routeName:
        builder = (context) => BlocProvider(
              create: (context) => LoginBloc(),
              child: const LoginView(),
            );
        fullscreenDialog = true;
        break;
      case ResetPasswordView.routeName:
        builder = (context) => const ResetPasswordView();
        break;
      case ForgotPasswordView.routeName:
        builder = (context) => const ForgotPasswordView();
        break;
      case ChangePasswordView.routeName:
        builder = (context) => const ChangePasswordView();
        break;
      case HomeView.routeName:
        builder = (context) => const HomeView();
        fullscreenDialog = true;
        break;
      case ProfileView.routeName:
        builder = (context) => const ProfileView();
        break;
      case PersonalDataView.routeName:
        builder = (context) => const PersonalDataView();
        break;
      case PersonalDataView2.routeName:
        builder = (context) => const PersonalDataView2();
        break;
      case OnlineConsultationView.routeName:
        builder = (context) => const OnlineConsultationView();
        break;
      case ConsultationDetailView.routeName:
        builder = (context) => const ConsultationDetailView();
        break;
      case ResepFormView.routeName:
        if (routeSettings.arguments is bool) {
          builder = (context) => ResepFormView(
                pop: routeSettings.arguments as bool,
              );
        } else {
          builder = (context) => const ResepFormView();
        }
        break;
      case ResepDetailView.routeName:
        if (routeSettings.arguments is bool) {
          builder = (context) => ResepDetailView(
                pop: routeSettings.arguments as bool,
              );
        } else {
          builder = (context) => const ResepDetailView();
        }
        break;
      case RujukanFormView.routeName:
        builder = (context) => const RujukanFormView();
        break;
      case RujukanDetailView.routeName:
        builder = (context) => const RujukanDetailView();
        break;
      case HistoryTransactionView.routeName:
        builder = (context) => const HistoryTransactionView();
        break;
      case ChatTransactionView.routeName:
        builder = (context) => const ChatTransactionView();
        break;
      case QueueListView.routeName:
        builder = (context) => const QueueListView();
        break;
      case MedicalRecordList.routeName:
        builder = (context) => const MedicalRecordList();
        break;
      case MedicalRecordDetailView.routeName:
        builder = (context) => const MedicalRecordDetailView();
        break;
      case MedicalRecordForm.routeName:
        builder = (context) => const MedicalRecordForm();
        break;
      case ScheduleListView.routeName:
        builder = (context) => const ScheduleListView();
        break;
      case ScheduleDetailView.routeName:
        builder = (context) => const ScheduleDetailView();
        break;
      case ScheduleEditForm.routeName:
        builder = (context) => const ScheduleEditForm();
        break;
      case ScheduleAddForm.routeName:
        builder = (context) => const ScheduleAddForm();
        break;
      default:
        builder = (context) => const SplashView();
        break;
    }

    return MaterialPageRoute<void>(
      settings: routeSettings,
      builder: builder,
      fullscreenDialog: fullscreenDialog,
      maintainState: true,
    );
  }
}
