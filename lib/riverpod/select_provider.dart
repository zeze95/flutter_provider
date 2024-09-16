import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:providertest/model/shopping_item_model.dart';

final selectProvider = StateNotifierProvider<SelectNotifier, ShoppingItemModel>(
    // 처음은 다루는 노티파이어, 다음은 사용할델 모델
    (ref) => SelectNotifier());

class SelectNotifier extends StateNotifier<ShoppingItemModel> {
  SelectNotifier()
      : super(ShoppingItemModel(
            name: '김치', quantity: 3, hasBought: false, isSpicy: true));

// toggleHasBought() {
//   state = ShoppingItemModel(
//       name: state.name,
//       quantity: state.quantity,
//       hasBought: !state.hasBought,
//       isSpicy: state.isSpicy);
// }
//
// toggleIsSpicy() {
//   final ts = TextStyle(fontSize: 20, fontWeight: FontWeight.w500);
//
//   state = ShoppingItemModel(
//       name: state.name,
//       quantity: state.quantity,
//       hasBought: state.hasBought,
//       isSpicy: state.isSpicy);
// }
// 이렇게 반복하게 되면 불편  그래서 copyWith 함수를 모델에 만들어두고
  toggleHasBought() {
    state = state.copyWith(hasBought: !state.hasBought);
  }

  toggleIsSpicy() {
    state = state.copyWith(isSpicy: !state.isSpicy);
  }
}
