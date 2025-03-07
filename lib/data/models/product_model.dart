class ProductModel{
  String message;
  bool status;
  List<DataModel> data;

  ProductModel({required this.message,required this.status,required this.data});

  factory ProductModel.fromJson(Map<String,dynamic> json){

    List<DataModel> mData=[];
    for(Map<String,dynamic> eachData in json["data"]){
      mData.add(DataModel.fromJson(eachData));
    }

    return ProductModel(
        message: json["message"],
        status: json["status"],
        data: mData);
  }
}


class DataModel{
  String category_id;
  String created_at;
  String id;
  String image;
  String name;
  String price;
  String status;
  String updated_at;

  DataModel({required this.category_id,required this.created_at,required this.id,required this.image,required this.name,required this.price,required this.status,required this.updated_at});

  factory DataModel.fromJson(Map<String,dynamic> json){
    return DataModel(
        category_id: json["category_id"],
        created_at: json["created_at"],
        id: json["id"],
        image: json["image"],
        name: json["name"],
        price: json["price"],
        status: json["status"],
        updated_at: json["updated_at"]);
  }
}