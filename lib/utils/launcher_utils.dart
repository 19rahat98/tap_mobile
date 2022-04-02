import 'dart:io';

import 'package:tapme/common/constants/global_link_constant.dart';
import 'package:url_launcher/url_launcher.dart';

/// открываем любую ссылку вне приложения
Future<void> launchLinks(String _link) async {
  if (await canLaunch(_link)) {
    await launch(_link);
  }
}

/// открывает приложение в магазине
void openStore() {
  if (Platform.isAndroid) {
    launchLinks(
      GlobalLinkConstant.playMarketUrl,
    );
    return;
  }
  launchLinks(GlobalLinkConstant.appStoreUrl);
}
