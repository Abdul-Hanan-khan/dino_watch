import 'package:url_launcher/url_launcher.dart';

class StaticVars{
  // static String userName='';
  // static String firstName='';
  // static String lastName='';
  // static String id='';
  // static String email='';
  // static String avatar='';


 static Future<void> customLauncher(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }
}