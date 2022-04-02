import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';

/// TODO: в core
/// запрашивает разрешение
Future<void> requestPermission({
  required Permission permission,
  Function()? onGrantedPermission,
  Function()? onDeniedForever,
  Function()? onDenied,
  Function()? onFinish
}) async {
  assert(permission != null);
  final status = await permission.request();

  if (status.isGranted) {
    onGrantedPermission?.call();
    onFinish?.call();
    return;
  }

  if (status.isPermanentlyDenied) {
    onDeniedForever?.call();
    onFinish?.call();
    return;
  }

  if (status.isDenied) {
    onDenied?.call();
    onFinish?.call();
    return;
  }
}
