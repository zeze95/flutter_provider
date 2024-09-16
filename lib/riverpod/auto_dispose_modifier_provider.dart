


import 'package:flutter_riverpod/flutter_riverpod.dart';

final AutoDisposeModifierProvider = FutureProvider.autoDispose<List<int>>((ref) async {
  // autoDispose 알아서 삭제를 한다는 뜻
  await Future.delayed(Duration(seconds: 2));

  return [1,3,4,5,6,7,8,9];
});

