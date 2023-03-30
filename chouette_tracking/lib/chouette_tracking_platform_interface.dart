import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'chouette_tracking_method_channel.dart';

abstract class ChouetteTrackingPlatform extends PlatformInterface {
  /// Constructs a ChouetteTrackingPlatform.
  ChouetteTrackingPlatform() : super(token: _token);

  static final Object _token = Object();

  static ChouetteTrackingPlatform _instance = MethodChannelChouetteTracking();

  /// The default instance of [ChouetteTrackingPlatform] to use.
  ///
  /// Defaults to [MethodChannelChouetteTracking].
  static ChouetteTrackingPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ChouetteTrackingPlatform] when
  /// they register themselves.
  static set instance(ChouetteTrackingPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
