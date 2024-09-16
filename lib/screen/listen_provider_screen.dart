import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:providertest/layout/riverpod_defalut_layout.dart';

import '../riverpod/listen_provider.dart';

class ListenProviderScreen extends ConsumerStatefulWidget {
  const ListenProviderScreen({super.key});

  @override
  ConsumerState<ListenProviderScreen> createState() =>
      _ListenProviderScreenState();
}

class _ListenProviderScreenState extends ConsumerState<ListenProviderScreen>
    with TickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    // TODO: implement initState
    controller = TabController(length: 10, vsync: this,initialIndex: ref.read(listenProvider));
    // 이닛스테이트에서는 절때 ref.watch 하면 안됨 단발적 실행이기때문에
    // 이렇게 initialIndex를 쓰면 이 스크린을 벗어났다가 다시 돌아와도
    // 나가기전에 마지막에 있었던 인덱스로 다시 들어옴
    // 열리는 디폴트 인덱스를 ref로 리드해서 넣었기때문에
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(listenProvider, (previous, next) {
      //previous 현재 , next는 다음을 보여준다
      if (previous != next) {
        controller.animateTo(next);
      }
    });
    return RiverpodDefalutLayout(
        title: 'ListenProviderScreen',
        body: TabBarView(
            physics: NeverScrollableScrollPhysics(), // 좌우 스크롤 막음
            controller: controller,
            children: List.generate(
                10,
                (index) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(index.toString()),
                        ElevatedButton(
                            onPressed: () {
                              ref.read(listenProvider.notifier).update(
                                  (state) => state == 0 ? 0 : state - 1); // 현재가 0이면 0에 남고 아니면 뒤로 가줌
                            },
                            child: const Text('뒤로')),
                        ElevatedButton(
                            onPressed: () {
                              ref.read(listenProvider.notifier).update(
                                  (state) => state == 10 ? 0 : state + 1); // 현재가 10이면 다음을 누르면 0으로 넘어가줌
                            },
                            child: const Text('다음')),
                      ],
                    ))));
  }
}
