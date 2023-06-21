import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:counter_button/counter_button.dart';
import 'package:food/FRONTEND/PAYMENT.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);
  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List pay = [];

  List<Map<dynamic, dynamic>> items = [
    {
      "id":1,
      "Fname": "Briyani",
      "Rating": 4.5,
      "Price": 150,
      "Type": "Non-Veg",
      "Image": "assets/pexels-rajesh-tp-1624487.jpg"
    },
    {
      "id":2,
      "Fname": "Dosa",
      "Rating": 4.0,
      "Price": 40,
      "Type": "Veg",
      "Image": "assets/pexels-saveurs-secretes-5560763.jpg"
    },
    {
      "id":3,
      "Fname": "Shawarma",
      "Rating": 4.9,
      "Price": 120,
      "Type": "Non-Veg",
      "Image": "assets/pexels-rajdeepcraft-6416559.jpg"
    },
  ];
  Map<int, int> count = {};
  bool isVisible = false;
  List results = [];
  List orders = [{}];
  String choice = "";
  @override
  initState() {
    for(int i=1;i<items.length+1;i++){
      count[i] = 0;
    }
    super.initState();
  }

  String add() {
    int c=0;
    for(int i=1;i<count.length+1;i++){
      c += count[i]!;
    }
    return c.toString();
  }

  String addprice() {
    orders =[];
    int sum = 0;
    for(int i=0;i<count.length;i++){
      sum += (count[items[i]["id"]]!*items[i]['Price']) as int;
      setState(() {
        if(count[items[i]["id"]]!=0){
          orders.add({
            'Id': items[i]["id"],
            'Item Price':items[i]['Price'],
            'Item Name': items[i]['Fname'],
            'Count': count[items[i]["id"]],
            'Tprice': (count[items[i]["id"]]!*items[i]['Price']),
          });
        }
      });
    }
    return '₹${sum.toString()}';
  }

  Color? color1 = Colors.white;
  Color? color2 = Colors.white;
  @override
  Widget build(BuildContext context) {
    setState(() {
      if (choice.isEmpty) {
        // if the search field is empty or only contains white-space, we'll display all users
        results = items;
      } else {
        results = items
            .where((user) =>
                user["Fname"].toLowerCase().contains(choice.toLowerCase()))
            .toList();
        // we use the toLowerCase() method to make it case-insensitive
      }
    });

    var size = MediaQuery.of(context).size;
    var height = size.height / 100;
    var width = size.width / 100;


    return Scaffold(
      backgroundColor: Colors.black12,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text("Restaurant"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 8,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: GestureDetector(
                 onTap: (){
                   setState(() {
                     if(color1==Colors.white){
                       color1 = Colors.red[100];
                     }
                     else{
                       color1 = Colors.white;
                     }
                   });
                 },
                 child: Container(
                   decoration: BoxDecoration(
                       color: color1,
                       borderRadius: BorderRadius.circular(8)
                   ),
                   child: Padding(
                     padding: const EdgeInsets.all(6.0),
                     child: Row(
                       children: [
                         Container(
                           alignment: Alignment.center,
                           decoration: BoxDecoration(
                             border: Border.all(width: 1,color: Colors.green)
                           ),
                             child: const Padding(
                               padding: EdgeInsets.all(1.0),
                               child: Icon(Icons.circle,color: Colors.green,size: 18,),
                             )
                         ),
                         const Padding(
                           padding: EdgeInsets.all(6.0),
                           child: Text("Veg",style: TextStyle(fontWeight: FontWeight.bold),),
                         )
                       ],
                     ),
                   ),
                 ),
               ),
             ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      if(color2==Colors.white){
                        color2 = Colors.red[100];
                      }
                      else{
                        color2 = Colors.white;
                      }
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: color2,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Row(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                border: Border.all(width: 1,color: Colors.red),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(1.0),
                                child: Icon(Icons.circle,color: Colors.red,size: 18),
                              )
                          ),
                          const Padding(
                            padding: EdgeInsets.all(6.0),
                            child: Text("Non-Veg",style: TextStyle(fontWeight: FontWeight.bold),),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 8,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 450,
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Search Customers',
                    contentPadding: const EdgeInsets.all(15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    labelText: 'Search',
                    suffixIcon: const Icon(Icons.search)),
                onChanged: (value) => {
                  setState(() {
                    choice = value;
                  })
                },
              ),
            ),
          ),
          const SizedBox(height: 8,),
          Stack(
            children: [
              Material(
                elevation: 10,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  
                  height: height * 70,
                  child: ListView.builder(
                      itemCount: results.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 145,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            results[index]['Fname'],
                                            style: TextStyle(
                                              fontSize: width * 6,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        Container(
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                border: Border.all(width: 1,color: results[index]["Type"]=="Veg"?Colors.green:Colors.red)
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(1.0),
                                              child: Icon(Icons.circle,color: results[index]["Type"]=="Veg"?Colors.green:Colors.red,size: 18,),
                                            )
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: RatingBarIndicator(
                                        itemSize: 20,
                                        rating: results[index]['Rating'],
                                        direction: Axis.horizontal,
                                        itemCount: 5,
                                        itemBuilder: (context, index) =>
                                            const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "₹${(results[index]['Price']).toString()}",
                                        style: TextStyle(
                                          fontSize: width * 5,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                results[index]['Image'],
                                              ),
                                              fit: BoxFit.cover),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20.0)),
                                        ),
                                        height: 80,
                                        width: 80,
                                      ),
                                    ),
                                    CounterButton(
                                      loading: false,
                                      onChange: (int val) {
                                        if(!(val<0)){
                                          setState(() {
                                            int id = results[index]['id'];
                                            count[id] = val;
                                          });
                                          if(int.parse(add())>0){
                                            isVisible = true;
                                          }
                                          else
                                            {
                                              isVisible = false;
                                            }
                                        }
                                      },
                                      count: count[results[index]['id']] as int,
                                      countColor: Colors.black,
                                      buttonColor: Colors.black,
                                      progressColor: Colors.black,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ),
              Positioned(
                height: (isVisible == false) ? 0 : 55,
                width: width * 100,
                bottom: 0,
                child: Visibility(
                    visible: isVisible,
                    child: Container(
                      width: width * 100,
                      color: Colors.black,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  (add()=='1')?'${add()} ITEM':'${add()} ITEMS',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  addprice(),
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TextButton(
                            child: const Text(
                              "NEXT >",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Payment(data: orders,)));
                            },
                          ),
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
