class ShoppingCart {

    static final ShoppingCart _instance = ShoppingCart._internal();

    factory ShoppingCart(){
      return _instance;
    }

    ShoppingCart._internal();

    List<ShoppingElement> _mealList = [];

    addMeal(Map<String, dynamic> meal, int count){

      if(count <= 0) {

        throw Exception("Item Count must be positive");

      }


      for(int a = 0; a < _mealList.length; a++){
        if(meal["id"] == _mealList[a].id){
          _mealList[a].itemCount += count;
          return;
        }
      }

      ShoppingElement element = ShoppingElement(

        id: meal["id"],
        name: meal["name"],
        description: meal["description"],
        price: meal["price"],
        itemCount: count

      );

      _mealList.add(element);
    }

  List<Map<String, String>> getListMap() {
    return _mealList.map((element) {
      return {
        'id': element.id.toString(),
        'name': element.name,
        'description': element.description,
        'price': element.price.toString(),
        'itemCount': element.itemCount.toString(),
      };
    }).toList();
  }


  List<ShoppingElement> getMealList(){
    return _mealList;
  }

  double getSum(){
    double sum = 0.0;
    for(int a = 0; a < _mealList.length; a++){
      sum += _mealList[a].price * _mealList[a].itemCount;
    }
    return sum;
  }

  void setItemCountById(int id, int itemCount){
    for(int a = 0; a < _mealList.length; a++){
      if(id == _mealList[a].id){
        _mealList[a].setItemCount(itemCount);
        return;
      }
    }
  }

  void clear(){
    _mealList.clear();
  }

}


class ShoppingElement {

  int id;
  String name;
  String description;
  double price;
  int itemCount;

  ShoppingElement({
      required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.itemCount,
    }) {
      if (itemCount <= 0) {
        throw ArgumentError('ItemCount must be bigger than 0');
      }
    }

  void setItemCount(int itemCount){
    this.itemCount = itemCount;
  }


}

