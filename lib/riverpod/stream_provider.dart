import 'package:flutter_riverpod/flutter_riverpod.dart';

final multipleStreamProvider = StreamProvider<List<int>>((ref) async* {
  for (int i = 0; i < 10; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield List.generate(3, (index) => index * i);
  }

  //리스트에 3개의 숫자들을 각인데스의 i랑 곱해서 내보내는것
});
