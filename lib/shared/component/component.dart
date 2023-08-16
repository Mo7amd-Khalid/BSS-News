import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/item_details/item_details.dart';
import 'package:news_app/shared/component/constance.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:toast/toast.dart';
import 'package:webview_flutter/webview_flutter.dart';


Widget myDivider() => Container(
  width: double.infinity,
  height: 1.0,
  color: Colors.grey[300],
);

Widget myDivider2() => Container(
  width: 1.0,
  height: 40,
  color: Colors.grey[300],
);

void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);

void navigateAndFinish(context, widget) => Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);

void showToast({
  required BuildContext context,
  required String message,
  Color color = Colors.black87,
})
{
  ToastContext().init(context);
  Toast.show(
    message,
    duration: Toast.lengthLong,
    gravity: Toast.bottom,
    backgroundColor: color,
    textStyle: TextStyle(
      color: Colors.white
    ),
  );
}


Widget itemBuilder(context, Map item) => InkWell(
  onTap: (){
    navigateTo(context, ItemDetailsScreen(ur:
        WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(item['url']))
    ));
  },
  child: Padding(
    padding: const EdgeInsets.all(15.0),
    child: Row(
      children:
      [
        if(item['urlToImage'] == null)
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              color: Colors.grey,
            ),
            width: 140,
            height: 130,
            child: Center(
            child: Text(
              AppCubit.get(context).lang == 'eg' ? "لا يوجد صورة" : "No image found",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
        if(item['urlToImage'] != null)
          Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage("${item['urlToImage']}"),
              )
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          width: 140,
          height: 130,
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: Container(
            height: 120,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    "${item['title']}",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text("${item['publishedAt'].split('T')[0]}",style: TextStyle(color: Colors.grey),),
              ],
            ),
          ),
        ),

      ],
    ),
  ),
);

Widget myTextFormField({
  required TextEditingController controller,
  required TextInputType keyboard,
  Function()? onTap,
  Function(String)? changeFunc,
  Function(String)? validate,
  InputBorder? outLineBorder,
  bool readOnly = false,
  bool obscure = false,
  IconData? prefix,
  IconData? suffix,
  Widget? label,
  TextDirection direction = TextDirection.ltr,
  Color? prefixIconColor,
  Color? textColor,
}) => TextFormField(
  style: TextStyle(
    color: textColor
  ),
  textDirection: direction,
  controller: controller,
  onTap: onTap,
  keyboardType: keyboard,
  obscureText: obscure,
  readOnly: readOnly,
  validator: (String? s){
    validate;
    return null;},
  onChanged: changeFunc,
  decoration: InputDecoration(
    prefixIcon: Icon(prefix, color: prefixIconColor,),
    label: label,
    suffixIcon: Icon(suffix),
    border: outLineBorder,
  ),

);


Widget MyDefaultButton({
  required Function() onPressed,
  Color? color,
  Widget? labelOfButton,
  double height = 20,
  double width = double.infinity,
  double radius = 0,
}) => Container(
  width: width,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    color: color,
  ),
  child:   MaterialButton(
    onPressed: onPressed,
    height: height,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: labelOfButton,
  ),
);
