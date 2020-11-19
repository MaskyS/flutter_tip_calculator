import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tip Calculator',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double totalAmount = 0;
  double billAmount = 0;
  double _tipPercentage = 15;
  double tipAmount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tip Calculator"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, // centers the children widgets
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
            // decoration: ShapeDecoration(
            //   shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.all(Radius.circular(5))),
            //   color: Colors.purple.shade100,
            // ),
            child: Column(
              children: [
                Text(
                  "Total Amount",
                  // style: TextStyle(
                  //   fontSize: 20,
                  //   fontWeight: FontWeight.bold,
                  //   color: Colors.purple.shade800,
                  // ),
                ),
                Padding(padding: EdgeInsets.all(5)),
                Text(
                  "\$${totalAmount.toStringAsFixed(2)}",
                  // style: TextStyle(
                  //   fontSize: 30,
                  //   fontWeight: FontWeight.w900,
                  //   color: Colors.purple.shade800,
                  // ),
                ),
              ],
            ),
          ),
          Card(
            margin: EdgeInsets.all(15),
            child: Column(
              children: [
                ListTile(
                  title: Text("Bill Amount"),
                  trailing: SizedBox(
                    width: 50,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (String amt) {
                        billAmount = double.parse(amt);
                        calculateTotal();
                      },
                    ),
                  ),
                ),
                ListTile(
                  title: Text("Tip "),
                  trailing: Text(
                    "\$${(tipAmount).toStringAsFixed(2)}",
                    // style: TextStyle(
                    //   fontSize: 25,
                    //   fontWeight: FontWeight.w700,
                    //   color: Colors.purple.shade800,
                    // ),
                  ),
                ),
                Slider(
                  value: _tipPercentage,
                  min: 0,
                  max: 100,
                  divisions: 20,
                  label: "${_tipPercentage.round()}%",
                  onChanged: setTipAndCalculateAmount,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void setTipAndCalculateAmount(double value) {
    setState(() {
      _tipPercentage = value;
      tipAmount = _tipPercentage / 100 * billAmount;
      calculateTotal();
    });
  }

  void calculateTotal() {
    setState(() => totalAmount = billAmount + tipAmount);
  }
}