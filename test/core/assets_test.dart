import 'package:barg_test/core/assets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test("Should parse userProfile json from assets", () async {
    final result = await parseJsonListFromAssets(AssetsPath.userProfilesJson);

    expect(result, isA<List>());
    expect(result.length, 6);
    expect(result[0]["name"], "Koch Hartman");
  });
}
