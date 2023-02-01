import 'package:flutter/material.dart';

class Overview extends StatefulWidget {
  final details;
  const Overview({Key? key, required this.details}) : super(key: key);

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
String total(){
  int x = 0;
  for(int i = 0; i < widget.details['Price'].length; i++){
    x += widget.details['Price'][i] as int;
  }
 return x.toString();
}
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var height = size.height/100;
    var width = size.width/100;


    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Order Summary"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Material(
            elevation: 20,
            child: Container(
              width: width*100,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Order No: ${widget.details['Order No'].toString()}",
                  style: TextStyle(
                    fontSize: width*6,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Material(
            elevation: 20,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff04D4F0),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Container(
                    width: width*100,
                    color: Colors.black,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Food Items",
                            style: TextStyle(
                              fontSize: width*6,
                              color: Colors.white
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Quantity",
                            style: TextStyle(
                              fontSize: width*6,
                                color: Colors.white
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Price",
                            style: TextStyle(
                              fontSize: width*6,
                                color: Colors.white
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: height*60,
                    width: 450,
                    color: Colors.white,
                    child: ListView.builder(
                        itemCount: widget.details["Items"].length,
                        itemBuilder: (BuildContext context, int index){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 200,
                                    child: Text(
                                      widget.details["Items"][index].toString(),
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: width*6,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    width: 40,
                                    child: Text(
                                      widget.details["Quantity"][index].toString(),
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: width*6,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    width: 80,
                                    child: Text(
                                      "₹${widget.details["Price"][index]}",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        fontSize: width*6,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                            ),
                          );
                        }
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Material(
            elevation: 20,
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text("Total Price",
                    style: TextStyle(
                      fontSize: width*6,
                    ),),
                    const SizedBox(
                      width: 90,
                    ),
                    Text("₹${total()}",
                      style: TextStyle(
                        fontSize: width*6,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
