import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

final Uri _urlweb = Uri.parse('https://siam.edu/');
final Uri _urlfacebook = Uri.parse('https://www.facebook.com/SiamUniversityBangkok');

class URLLaunch {
  void launchURLWeb() async {
    if (!await canLaunchUrl(_urlweb)) {
      launchUrlString('https://siam.edu/');
      //await launchUrl(_urlweb);
    } else {
      throw 'Could not launch $_urlweb';
    }
  }

  void launchURLFacebook() async {
    if (!await canLaunchUrl(_urlfacebook)) {
      //await launchUrl(_urlfacebook);
      launchUrlString('https://www.facebook.com/SiamUniversityBangkok');
    } else {
      throw 'Could not launch $_urlfacebook';
    }
  }
}
