import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_ev_yenileme/oyun_ev_yenileme.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(evYenilemeConfig.title.length, 33);
    expect(evYenilemeConfig.tagline.length, 33);
    for (final s in evYenilemeConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(evYenilemeConfig.gameId, evYenilemeId);
    expect(evYenilemeRules.gameId, evYenilemeId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(evYenilemeRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: evYenilemeId, optionalMechanics: evYenilemeRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(evYenilemeRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
