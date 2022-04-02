import 'dart:developer';

/// расширение для всех типов коллекций
extension CollectionExtension<E> on Iterable<E> {
  /// групперует структуру данных
  Map<K, List<E>> groupBy<K>(K Function(E) keyFunction) => fold(
        <K, List<E>>{},
        (Map<K, List<E>> map, E element) =>
            map..putIfAbsent(keyFunction(element), () => <E>[]).add(element),
      );

  /// получаем значение по индексу безопастно
  E getOrNull(int index) {
    return toList()[index];
  }
}
