import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  final data;
  const Payment(
      {Key? key, required this.data}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  List a = [];
  int Total = 0;
  double Tax = 0.0;
  double Gtotal = 0.0;
  String payment = "";
  @override
  initState() {
    addItems();
    super.initState();
  }

  void addItems() {
    for (int i = 0; i < widget.data.length; i++) {
      Total += widget.data[i]['Tprice'] as int;
    }
    Tax = (0.06) * Total;
    Gtotal = (Total + Tax);
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
        title: const Text("Payment"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width*100,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Your order",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: width*6,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Material(
            elevation: 20,
            child: Container(
              color: Colors.white,
              height: 250,
              width: 500,
              child: ListView.builder(
                itemCount: widget.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(width: 0.5,color: Colors.grey))
                      ),
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.data[index]["Item Name"].toString(),
                                  style: TextStyle(
                                    fontSize: width*4,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "₹${widget.data[index]["Item Price"]}",
                                  style: TextStyle(
                                    fontSize: width*4,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  child: Text(
                                    widget.data[index]['Count'].toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  child: Text(
                                    "₹${widget.data[index]['Tprice']}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Material(
            elevation: 20,
            child: Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Item Total",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Taxes & Charges",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Grand Total",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          "₹${Total.toString()}",
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          "₹${Tax.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "₹${Gtotal.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Material(
            elevation: 20,
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Payment Method",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ListTile(
                      title: const Text(
                        "UPI",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      leading: Radio(
                          value: "upi",
                          groupValue: payment,
                          onChanged: (value) {
                            setState(() {
                              payment = value.toString();
                            });
                          }),
                    ),
                    ListTile(
                      title: const Text(
                        "Cash",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      leading: Radio(
                          value: "cash",
                          groupValue: payment,
                          onChanged: (value) {
                            setState(() {
                              payment = value.toString();
                            });
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: (){

              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 350,
                decoration: const BoxDecoration(
                  color: Color(0xff04D4F0),
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                ),
                child: const Text(
                'Pay Order',
                style: TextStyle(fontSize: 20.0),
              ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
