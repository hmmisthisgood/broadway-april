import 'package:boilerplate/feature/authentication/bloc/authentication_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/app/theme.dart';
import 'package:boilerplate/common/constant/env.dart';
import 'package:boilerplate/common/constant/strings.dart';
import 'package:boilerplate/common/navigation/nav.dart';
import 'package:boilerplate/common/route/route_generator.dart';
import 'package:boilerplate/common/route/routes.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../common/widget/bloc/multi_bloc_listing.dart';
import '../common/widget/bloc/multi_repo_listing.dart';
import 'notification_wrapper.dart';
import 'update_wrapper.dart';

class App extends StatefulWidget {
  final Env env;
  App({Key? key, required this.env}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiRepoListing(
      env: widget.env,
      child: MultiBlocListing(
        child: NotificationWrapper(
          child: UpdateWrapper(
              child: MaterialApp(
            locale: context.locale,
            navigatorKey: Nav.navKey,
            builder: DevicePreview.appBuilder,
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            debugShowCheckedModeBanner: false,
            darkTheme: CustomTheme.darkTheme,
            theme: CustomTheme.lightTheme,
            title: Strings.APP_TITLE,
            initialRoute: Routes.root,
            onGenerateRoute: RouteGenerator.generateRoute,
          )),
        ),
      ),
    );
  }
}
