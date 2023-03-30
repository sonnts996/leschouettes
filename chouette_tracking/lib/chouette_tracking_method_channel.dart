import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'chouette_tracking_platform_interface.dart';

/// An implementation of [ChouetteTrackingPlatform] that uses method channels.
class MethodChannelChouetteTracking extends ChouetteTrackingPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('chouette_tracking');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
