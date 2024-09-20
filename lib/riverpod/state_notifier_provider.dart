import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:providertest/model/shopping_item_model.dart';


final ShoppingListProvider = StateNotifierProvider<ShoppingListNotifier,List<ShoppingItemModel>>((ref)=> ShoppingListNotifier());
// StateNotifierProvider에 타입이 두개 들어가는데 처음에는 만들어진 노티파이어 그리고 두번째는 상속받아 관리하는 타입을 넣어줌
class ShoppingListNotifier extends StateNotifier<List<ShoppingItemModel>> {
  // ShoppingListNotifier():
  //       super([]);
  // 이렇게 만들어 놔야함
  // 클래스안에서 복잡한 값을 다루고 있기때문에 이렇게 메소드를 이용해서 값을 담아두는 거임
  ShoppingListNotifier()
      : super([
          ShoppingItemModel(
              name: '김치', quantity: 3, hasBought: false, isSpicy: true),
          ShoppingItemModel(
              name: '라면', quantity: 5, hasBought: false, isSpicy: true),
          ShoppingItemModel(
              name: '수박', quantity: 3, hasBought: true, isSpicy: false),
          ShoppingItemModel(
              name: '치킨', quantity: 4, hasBought: true, isSpicy: false)
        ]);

  void toggleHasBought({required String name}) {
    state = state
        .map((e) => e.name == name
            ? ShoppingItemModel(
                name: e.name,
                quantity: e.quantity,
                hasBought: !e.hasBought,
                isSpicy: e.isSpicy)
            : e)
        .toList();
    // StateNotifier 에 자동으로 제공되는 값으로 사용 가능함 super 안의 값들이 이 state가 들어감
    // 그래서 가져와서 맵으로 뿌려서 name과 이름이 매치되는것을 찾아서
    // 구매 여부에 토글을 해줌
  }
}
