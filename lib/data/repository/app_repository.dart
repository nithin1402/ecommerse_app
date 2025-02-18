import 'package:ecommerce_app/data/remote/api_helper.dart';
import 'package:ecommerce_app/data/remote/urls.dart';

class AppRepository{
  ApiHelper apiHelper;
  AppRepository({required this.apiHelper});

  Future<dynamic> registerUser({required Map<String,dynamic> bodyParameters}) async{

    try{
      return await apiHelper.postApi(url: AppUrls.REGISTER_URL,bodyPrams: bodyParameters);
    }catch (e){
      throw(e);
    }
  }

}