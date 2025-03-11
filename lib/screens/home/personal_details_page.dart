import 'package:ecommerce_app/data/models/product_model.dart';
import 'package:ecommerce_app/screens/home/my_orders_page.dart';
import 'package:flutter/material.dart';

class PersonalDetailsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    List<String> aboutText = [
      "My Orders",
      "Settings",
      "Log Out"
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 21,),
            Center(
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey
                ),
                child: Icon(Icons.person,size: 80,color: Colors.white,),
              ),
            ),
            SizedBox(height: 51,),
            Expanded(
              child: ListView.builder(
                itemCount: aboutText.length,
                  itemBuilder: (context,index){
                return ListTile(
                  title: InkWell(
                    onTap: (){
                      if(aboutText[index]=="My Orders"){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MyOrdersPage()));
                      }
                    },
                      child: Text(aboutText[index],style: TextStyle(fontSize: 18),)));
              }),
            )
          ],
        ),
      )
    );
  }
}
