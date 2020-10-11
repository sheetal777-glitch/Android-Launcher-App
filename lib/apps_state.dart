import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:device_apps/device_apps.dart';

final appsProvider = FutureProvider<List<Application>>((ref) {
  return DeviceApps.getInstalledApplications(includeAppIcons: true);
});
