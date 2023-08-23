class HomePagesStates {
  const HomePagesStates({this.index = 0});
  final int index;
  
  HomePagesStates copyWith({int? index}) {
    return HomePagesStates(
        index: index ?? this.index,
    );
  }
}