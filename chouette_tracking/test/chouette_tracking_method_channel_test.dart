import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:chouette_tracking/chouette_tracking_method_channel.dart';

void main() {
  MethodChannelChouetteTracking platform = MethodChannelChouetteTracking();
  const MethodChannel channel = MethodChannel('chouette_tracking');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
