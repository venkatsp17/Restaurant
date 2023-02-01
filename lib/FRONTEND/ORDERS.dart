import 'package:flutter/material.dart';
import 'package:food/FRONTEND/SUMMARY.dart';
class Orders extends StatefulWidget {

  const Orders({Key? key,}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {

  Color select_color(String x){
    if(x == "Delivered") {
     return const Color(0xff4CBB17);
    }
    else if(x == "Pending"){
      return const Color(0xffE3963E);
    }
    else{
      return const Color(0xffFF0000);
    }
  }
  List<Map<dynamic, dynamic>> details = [
    {
      "Order No": "AB1234",
      "Total Price": "₹1000",
      "Status": "Delivered",
      "Items": ['Briyani','Parotta','Nuggets'],
      "Quantity": [2,1,2],
      "Price": [120,40,80]
    },
    {

      "Order No": "BT6542",
      "Total Price": "₹4000",
      "Status": "Pending",
      "Items": ['Dosa','Shawarma','Pepper Chicken Gravy'],
      "Quantity": [4,2,1],
      "Price": [40,110,100]
    },
    {

      "Order No": "PU0987",
      "Total Price": "₹500",
      "Status": "Cancelled",
      "Items": ['Butter Naan','Chicken fried Rice','Chilli Chicken'],
      "Quantity": [5,1,3],
      "Price": [30,70,50]
    },
  ];

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var height = size.height/100;
    var width = size.width/100;


    return Scaffold(
      floatingActionButton: FloatingActionButton(
      backgroundColor: Colors.black,
        child: const Icon(Icons.add,color: Colors.white,size: 40,),
        onPressed: () {
        Navigator.pushNamed(context, '/menu');
        },
      ),
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Orders"),
        centerTitle: true,
      ),
      body:Column(
        children: [
          SizedBox(
            height: height*90,
            width: width*100,
            child: ListView.builder(
              itemCount: details.length,
              itemBuilder: (BuildContext context, int index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context, MaterialPageRoute(builder: (context)=> Overview(details: details[index])));
                    },
                    child: Material(
                      elevation: 20,
                      child: Container(
                        decoration: const BoxDecoration(
                          // border: Border.all(color: Colors.blueGrey),
                          boxShadow: [
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ),
                        ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text(
                                  details[index]['Order No'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: width*8,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Text(
                                      details[index]['Total Price'].toString(),
                                      style: TextStyle(
                                        fontSize: width*6,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Container(
                                      alignment: Alignment.center,
                                      height:35,
                                      width:100,
                                      decoration: BoxDecoration(
                                        color: select_color(details[index]['Status'].toString()),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          details[index]['Status'],
                                          style:  TextStyle(
                                            fontSize: width*4,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }

            ),
          ),
        ],
      ),

    );
  }
}
