import 'package:flutter_riverpod/flutter_riverpod.dart';

final numberProvider = StateProvider<int>((ref)=> 0);
//StateProvider 단순한 데이터(map이나 list같은 것이 아닌 string이나 int )를 다루며 ui에서 직접 수정

//StateNotifierProvider UI에서 직접적으로 데이터를 다루지만 map이나 list은 다룬다고
