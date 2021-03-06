import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';

/// A container for iOS and Android App IDs.
class AppSet {
  /// The ID on App Store.
  int iosAppId;

  /// Represents the product identifier for the promoted product you want the
  /// store to display at the top of the page.
  ///
  /// See
  /// https://developer.apple.com/documentation/storekit/skstoreproductparameterproductidentifier?language=objc
  String iosIapId;

  /// Your affiliate identifier.
  ///
  /// You receive an affiliate identifier when you sign up for Apple's Affiliate
  /// Program.
  ///
  /// See
  /// https://developer.apple.com/documentation/storekit/skstoreproductparameteraffiliatetoken
  String iosAffiliateToken;

  /// Represents an App Analytics campaign.
  ///
  /// This token allows you to track the effectiveness of your Affiliate Program
  /// link and your App Analytics campaign.
  ///
  /// See
  /// https://developer.apple.com/documentation/storekit/skstoreproductparametercampaigntoken
  String iosCampaignToken;

  /// Represents the advertising partner you wish to use.
  ///
  /// See
  /// https://developer.apple.com/documentation/storekit/skstoreproductparameteradvertisingpartnertoken
  String iosAdvertisingPartnerToken;

  /// Represents the provider token for the developer that created the app.
  ///
  /// See
  /// https://developer.apple.com/documentation/storekit/skstoreproductparameterprovidertoken
  String iosProviderToken;

  /// The Android package name.
  String androidPackageName;

  Map toJson() => {
        'iosAppId': iosAppId,
        'iosAffiliateToken': iosAffiliateToken,
        'iosCampaignToken': iosCampaignToken,
        'iosAdvertisingPartnerToken': iosAdvertisingPartnerToken,
        'iosProviderToken': iosProviderToken,
        'androidPackageName': androidPackageName,
      };
}

/// The plugin that helps to guide users to install apps.
///
/// To use the plugin, create an instance of [AppSet] and then pass it to
/// [FlutterInstallAppPlugin.installApp].
class FlutterInstallAppPlugin {
  static const MethodChannel _channel =
      const MethodChannel('flutter_install_app_plugin');

  /// Invokes the user interface on the current platform to install other apps.
  static Future<void> installApp(AppSet app) async {
    var map = app.toJson();
    var string = json.encode(map);
    await _channel.invokeMethod('installApp', string);
  }
}
