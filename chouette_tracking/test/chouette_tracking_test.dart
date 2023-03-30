import 'package:flutter_test/flutter_test.dart';
import 'package:chouette_tracking/chouette_tracking.dart';
import 'package:chouette_tracking/chouette_tracking_platform_interface.dart';
import 'package:chouette_tracking/chouette_tracking_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockChouetteTrackingPlatform
    with MockPlatformInterfaceMixin
    implements ChouetteTrackingPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ChouetteTrackingPlatform initialPlatform = ChouetteTrackingPlatform.instance;

  test('$MethodChannelChouetteTracking is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelChouetteTracking>());
  });

  test('getPlatformVersion', () async {
    ChouetteTracking chouetteTrackingPlugin = ChouetteTracking();
    MockChouetteTrackingPlatform fakePlatform = MockChouetteTrackingPlatform();
    ChouetteTrackingPlatform.instance = fakePlatform;

    expect(await chouetteTrackingPlugin.getPlatformVersion(), '42');
  });
}
