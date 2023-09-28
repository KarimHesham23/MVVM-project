import 'package:bookly_app/core/helpers/show_message.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> customLaunchUrl(context, String? uri) async {
  if (uri != null) {
    Uri url = Uri.parse(uri);
    if (await launchUrl(url)) {
      await launchUrl(url);
    } else {
      showMessage(context, message: "Cannot launch $uri");
    }
  } else {
    showMessage(context, message: "Book Not Avaliable");
  }
}
