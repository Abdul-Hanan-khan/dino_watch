// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// import '../../../core/utils/image_constant.dart';
// import '../../commamn/app_bar.dart';
//
// class CustomCheckoutScreen extends StatelessWidget {
//   String url;
//   CustomCheckoutScreen({required this.url});
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         // appBar: appBar(
//         //   text: "Checkout",
//         //   back: true,
//         //   actionIcon: true,
//         //   action: ImageConstant.bag,
//         // ),
//         body: Stack(
//           children: [
//             const Center(child: CircularProgressIndicator(),),
//             WebView(
//               initialUrl: url ,
//             ),
//           ],
//         )
//       ),
//     );
//   }
// }
