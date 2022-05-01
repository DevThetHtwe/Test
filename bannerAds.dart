import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mmflix/src/mini_widgets.dart';

class BannerAds extends StatefulWidget {
  const BannerAds({Key? key}) : super(key: key);

  @override
  _BannerAdsState createState() => _BannerAdsState();
}

final BannerAdListener listener = BannerAdListener(
  onAdLoaded: (Ad ad) => debugPrint('Ad loaded.'),
  onAdFailedToLoad: (Ad ad, LoadAdError error) {
    ad.dispose();
    debugPrint('Ad failed to load: $error');
  },
  onAdOpened: (Ad ad) => debugPrint('Ad opened.'),
  onAdClosed: (Ad ad) => debugPrint('Ad closed.'),
  onAdImpression: (Ad ad) => debugPrint('Ad impression.'),
);

class _BannerAdsState extends State<BannerAds> {
  final BannerAd myBanner = BannerAd(
    adUnitId: bannerA,
    size: AdSize.banner,
    request: const AdRequest(),
    listener: listener,
  );

  @override
  void initState() {
    myBanner.load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AdWidget adWidget = AdWidget(ad: myBanner);
    return Container(
      child: myBanner != null
          ? SizedBox(
              width: myBanner.size.width.toDouble(),
              height: myBanner.size.height.toDouble(),
              child: adWidget)
          : const SizedBox(height: 0, width: 0),
    );
  }
}
