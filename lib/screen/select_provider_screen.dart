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

    ref.listen(
        selectProvider.select((value) => value.hasBought), (previous, next) {
      print('next :$next')
    })
    // 리슨에도 똑같이 .select((value)=>value 를 적용 할수 있음
    // watch는 빌드가 재실행이지만 리슨은 재 빌드 되지않음
    //

    return RiverpodDefalutLayout(
        title: 'SelectProviderScreen',
        body: SizedBox(
            width: double.infinity,
            child: Column(
                children: [
                // Text(state.name),
                // Text(state.isSpicy.toString()),
                // Text(state.hasBought.toString()),
                Text(state.toString());
        ElevatedButton(onPressed: (){
      ref.read(selectProvider.notifier).toggleHasBought()},
    child: Text('HasBought Toggle'))
    ],
    )
    ,
    )
    );

  }
