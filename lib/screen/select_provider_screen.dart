import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:providertest/riverpod/select_provider.dart';

import '../layout/riverpod_defalut_layout.dart';

class SelectProviderScreen extends ConsumerWidget {
  const SelectProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('build');
    final state = ref.watch(selectProvider.select((value) => value.isSpicy));
    // .select((value)=>value.isSpicy 를 추가로 입력
    // 이럴경우 isSpict가 바뀔때만 빌드가 재 실행됨
    final name = ref.watch(selectProvider.select((value) => value.name));

    ref.listen<String>(selectProvider.select((value) => value.name),
        (previous, next) {
      print('previous: $previous / next: $next');
    });
    // 리슨에도 똑같이 .select((value)=>value 를 적용 할수 있음
    // watch는 빌드가 재실행이지만 리슨은 재 빌드 되지않음
    //

    return RiverpodDefalutLayout(
      title: 'SelectProvider',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Text(state.name),
// Text(state.isSpicy.toString()),
// Text(state.hasBought.toString()),
          Text(
            'name: ${name}',
            textAlign: TextAlign.center,
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('ToggleName'),
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    ref.read(selectProvider.notifier).toggleIsSpicy();
                  },
                  child: Text('ToggleSpicy'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
