import 'package:firebase_admob/firebase_admob.dart';

class AdmobInfo {

  static final bannerId = 'ca-app-pub-6535468335547144/4705803058';
  static final interstitialId = 'ca-app-pub-6535468335547144/5757323983';

  static BannerAd bannerAd;
  static InterstitialAd interstitialAd;

  static MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    keywords: <String>['flutterio', 'beautiful apps'],
    contentUrl: 'https://flutter.io',
    childDirected: false, // or female, unknown
    testDevices: <String>[], // Android emulators are considered test devices
  );
}