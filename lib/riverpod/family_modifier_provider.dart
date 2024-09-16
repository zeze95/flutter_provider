import 'package:flutter_riverpod/flutter_riverpod.dart';

// final FamilyModifierProvider = FutureProvider((ref) async {
//
//   await Future.delayed(Duration(seconds: 2));
//
//   return [1,2,3,4,5,6,7,8,9];
//
// });
// 이렇게하면 정상적으로 되나 프로바이더에 .family를 넣을땐 파라미터가 2개가 필요함

final FamilyModifierProvider =
    FutureProvider.family<List<int>, int>((ref, data) async {
  await Future.delayed(Duration(seconds: 2));

  return List.generate(5, (index) => index * data);
});
