import 'package:url_launcher/url_launcher.dart';

launchWhatsapp() async {
  var whatsapp = "+6283111012720";
  var whatsappAndroid =Uri.parse("whatsapp://send?phone=$whatsapp");
  if (await canLaunchUrl(whatsappAndroid)) {
    await launchUrl(whatsappAndroid);
  } else {
    throw const FormatException('Error');
  }
}