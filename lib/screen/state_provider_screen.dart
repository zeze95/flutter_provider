import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:providertest/layout/riverpod_defalut_layout.dart';
import 'package:providertest/riverpod/state_provider.dart';

class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(numberProvider); // 직접적으로 ui에 반영하기 위해쓰는것

    return RiverpodDefalutLayout(
        title: 'StateProviderScreen',
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(provider.toString()),
              ElevatedButton(
                  onPressed: () {
                    ref.read(numberProvider.notifier)
                        .update((state) => state + 1); // read 를 통해 프로바이더를 가져와 notifier를 붙이고 update로 값을 업데이트 시킴
                  },
                  child: const Text('UP')),
              ElevatedButton(
                  onPressed: () {
                    ref.read(numberProvider.notifier)
                        .state = ref.read(numberProvider.notifier).state - 1;
                    //  read 를 통해 프로바이더를 가져와 notifier를 붙이고 state로 상태를 변경함
                  },
                  child: const Text('DOWN')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>_NextScreen()));
                  },
                  child: const Text('NextScreen'))
            ],
          ),
        ));
  }
}


class _NextScreen extends ConsumerWidget {
  const _NextScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(numberProvider); // 직접적으로 ui에 반영하기 위해쓰는것
    return RiverpodDefalutLayout(
        title: 'StateProviderScreen',
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(provider.toString()),
              ElevatedButton(
                  onPressed: () {
                    ref.read(numberProvider.notifier)
                        .update((state) => state + 1);
                  },
                  child: const Text('UP'))
            ],
          ),
        ));
  }
}


// ref.read vs ref.watch
// • ref.watch는 반환값의 업데이트가 있을때 지속적으로 build 함수를 다시 실행해준다.
// • ref.watch는 필수적으로 UI관련 코드에만 사용한다.
// • ref.read는 실행되는순간 단 한번만 provider 값을 가져온다.
// • ref.read는 onPressed 콜백처럼 특정 액션 뒤에 실행되는 함수 내부에서 사용된다
