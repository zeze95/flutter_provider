import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:providertest/layout/riverpod_defalut_layout.dart';
import 'package:providertest/riverpod/future_provider.dart';

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue state = ref.watch(multiplesFutureProvider);
    // AsyncValue라는 상태로 받아오면 무조건 when으로 받아와서 데이터가 있을때, 오류가 있을때, 로딩일때마다 구분하여 실행할걸 구분해둘수 있다
    return RiverpodDefalutLayout(
        title: 'FutureProviderScreen',
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            state.when(
                data: (data) {
                  return Text(data.toString(), textAlign: TextAlign.center);
                },
                error: (err, stack) => Text(err.toString()),
                loading: () => Center(
                      child: CircularProgressIndicator(),
                    ))
            // 여기서 강제로 2초 딜레이를 주긴 했지만 future로 값이 안올 경우 로딩으로 진행함
          ],
        ));
  }
}
