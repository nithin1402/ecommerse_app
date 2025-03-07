import 'dart:convert';

import 'dart:io';

import 'package:ecommerce_app/data/remote/app_exception.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiHelper{

  Future<dynamic> postApi({required String url,Map<String,dynamic>? bodyPrams, bool isHeaderRequired  = true,Map<String,String>? mHeaders,}) async{
    var uri = Uri.parse(url);

    try{

      if(isHeaderRequired){
        SharedPreferences preferences = await SharedPreferences.getInstance();
        String token = preferences.getString("token") ?? "";

        print(token);

        if(mHeaders!=null) {
          mHeaders = {"Authorization": "Bearer $token"};
        }else{
          mHeaders = {"Authorization": "Bearer $token"};
        }
      }

      var res = await http.post(uri,body: bodyPrams!=null ? jsonEncode(bodyPrams) : null,headers: mHeaders ?? null);
      return returnJsonResponse(res);
    }on SocketException catch(e){
      throw FetchDataException(errorMsg: e.toString());
    }
  }

  Future<dynamic> getApi({required String url, bool isHeaderRequired  = true,Map<String,String>? mHeaders,}) async{
    var uri = Uri.parse(url);

    try{

      if(isHeaderRequired){
        SharedPreferences preferences = await SharedPreferences.getInstance();
        String token = preferences.getString("token") ?? "";

        print(token);

        if(mHeaders!=null) {
          mHeaders = {"Authorization": "Bearer $token"};
        }else{
          mHeaders = {"Authorization": "Bearer $token"};
        }
      }

      var res = await http.get(uri,headers: mHeaders ?? null);
      return returnJsonResponse(res);
    }on SocketException catch(e){
      throw FetchDataException(errorMsg: e.toString());
    }
  }

  dynamic returnJsonResponse(http.Response response){
    switch (response.statusCode){
      case 200:
      {
        var mData = jsonDecode(response.body);
        return mData;
      }
      case 400:
        throw BadRequestException(errorMsg: response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(errorMsg: response.body.toString());
      case 500:
      default:
        throw FetchDataException(errorMsg: "Error occurred while communicating with the server with statuscode: ${response.body}");
    }
  }

}