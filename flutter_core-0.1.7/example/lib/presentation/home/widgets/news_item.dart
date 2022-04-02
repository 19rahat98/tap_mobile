import 'package:flutter/widgets.dart';
import 'package:flutter_core/core/utils/extension/string_extension.dart';

typedef ClickWidget = void Function();

class NewsItem extends StatelessWidget {
  String title;
  String description;
  String imageUrl;

  GestureTapCallback callback;

  NewsItem(this.title, this.description, this.imageUrl, this.callback);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Image.network(imageUrl), Text(title), Text(description)],
      ),
    );
  }
}
