import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:providertest/layout/riverpod_defalut_layout.dart';
import 'package:providertest/model/shopping_item_model.dart';
import 'package:providertest/riverpod/state_notifier_provider.dart';

class StateNotifierProvider extends ConsumerWidget {
  const StateNotifierProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<ShoppingItemModel> state = ref.watch(ShoppingListProvider);
    // state는 ShoppingListProvider에 입력해둔 값들이 들어옴

    return RiverpodDefalutLayout(
        title: 'StateNotifierProvider',
        body: ListView(
          children: state
              .map((e) => CheckboxListTile(
                  title: Text(e.name),
                  value: e.hasBought,
                  onChanged: (value) {
                    ref
                        .read(ShoppingListProvider.notifier)
                        .toggleHasBought(name: e.name);
                    // 이렇게 내부에 설정해둔 toggleHasBought를 가져와서 쓸수 있음
                    // value를 통해 값
                  }))
              .toList(),
        ));
  }
}
