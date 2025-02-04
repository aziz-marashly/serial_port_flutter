import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:serial_port_flutter/serial_port_flutter.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_serial_port');

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
    expect(await FlutterSerialPort.platformVersion, '42');
  });
}
