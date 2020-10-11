import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'apps_state.dart';

final modeProvider = StateProvider((ref) => DisplayMode.Grid);
enum DisplayMode { Grid, List }

class AppsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, watch, child) {
        final appsInfo = watch(appsProvider);
        // final mode = watch(modeProvider);
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 10, 10),
              child: appsInfo.when(
                data: (List<Application> apps) => GridView.builder(
                    itemCount: apps.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        crossAxisCount: 4),
                    itemBuilder: (_, index) {
                      ApplicationWithIcon app = apps[index];
                      return AppGridItem(app: app);
                    }),
                loading: () => Center(child: CircularProgressIndicator()),
                error: (err, trace) => Container(),
              ),
            ),
          ),
        );
      },
    );
  }
}

class AppGridItem extends StatelessWidget {
  final ApplicationWithIcon app;

  const AppGridItem({Key key, this.app}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: Image.memory(app.icon, fit: BoxFit.contain, width: 40.0),
          ),
          Text(app.appName, maxLines: 1, overflow: TextOverflow.ellipsis),
        ],
      ),
      onTap: () {
        DeviceApps.openApp(app.packageName);
      },
    );
  }
}
