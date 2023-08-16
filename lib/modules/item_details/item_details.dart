import 'package:flutter/material.dart';
import 'package:news_app/shared/style/icon_broken.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ItemDetailsScreen extends StatelessWidget {

  final WebViewController ur;
  ItemDetailsScreen({super.key,
    required this.ur
});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(IconBroken.Arrow___Left_2,color: Colors.black,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: WebViewWidget(controller: ur,)
    );
  }
}
