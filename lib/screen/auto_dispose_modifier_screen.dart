import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:providertest/layout/riverpod_defalut_layout.dart';

import '../riverpod/auto_dispose_modifier_provider.dart';

class AutoDisposeModifierScreen extends ConsumerWidget {
  const AutoDisposeModifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(AutoDisposeModifierProvider);
    // 이경우 스크린에 왔다가 나갔다가 다시 스크린으로 오면 다시 로딩이 되고 페이지가 보여짐
    // AutoDisposeModifierProvider 같은 경우에는 동일한 로직이더리라도 autoDispose라는 키워드때문에 캐시를 삭제해서
    // 처음부터 다시 생성을 한다.
    // 즉 필요없을땐 삭제하고 필요할땐 다시 생성한다는 것
    //state가 AsyncLoading<List<int>> 타입이였다가  AsyncData<List<int>> 타입으로 바뀜

    return RiverpodDefalutLayout(
        title: 'AutoDisposeModifierScreen',
        body: Center(
            child: state.when(
                data: (data) => Text(
                      data.toString(),
                    ),
                error: (err, stack) => Text(err.toString()),
                loading: () => CircularProgressIndicator())));
  }
}
