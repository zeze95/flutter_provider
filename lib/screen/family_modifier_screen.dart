import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:providertest/layout/riverpod_defalut_layout.dart';

import '../riverpod/family_modifier_provider.dart';

class FamilyModifierScreen extends ConsumerWidget {
  const FamilyModifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final state = ref.watch(FamilyModifierProvider);
    // 기존 방식대로 하면 오류 발생 => family로 해두었기에 안됨
    // 왜냐ㅕ하면 ref말고도 data도 있어서... 그것도 넣어줘야함

    final  state = ref.watch(FamilyModifierProvider(5)); //AsyncData<List<int>>

    return RiverpodDefalutLayout(
      title: 'FamilyModifierScreen',
      body: Center(
          child: state.when(
              data: (data) => Text(
                    data.toString(),
                  ),
              error: (err, stack) => Text(err.toString()),
              loading: () => CircularProgressIndicator())),
    );
  }
}
