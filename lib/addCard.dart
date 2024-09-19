import 'package:flutter/material.dart';
import 'package:imtihon5/card.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

void main() {
  runApp(MaterialApp(
    home: AddCardScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class AddCardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(),
      body: CardForm(),
    );
  }
}

class CardForm extends StatefulWidget {
  @override
  _CardFormState createState() => _CardFormState();
}

class _CardFormState extends State<CardForm> {
  bool bol = true;
  bool bol2 = true;
  void func() {
    setState(() {
      bol = !bol;
    });
  }

  void func2() {
    setState(() {
      bol2 = !bol2;
    });
  }

  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cvcController = TextEditingController();
  final TextEditingController cardholderNameController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 350,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: cardNumberController,
              keyboardType: TextInputType.number,
              maxLength: 16,
              decoration: InputDecoration(
                labelText: "Card number",
                hintText: "0000 0000 0000 0000",
                suffixIcon: Icon(Icons.credit_card),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    maxLength: 6,
                    controller: expiryDateController,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      labelText: "Expiry date",
                      hintText: "MM / YY",
                      suffixIcon: Icon(Icons.calendar_today_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    maxLength: 3,
                    keyboardType: TextInputType.number,
                    obscureText: bol2,
                    controller: cvcController,
                    decoration: InputDecoration(
                      labelText: "CVC/CVV",
                      hintText: "...",
                      suffixIcon: ZoomTapAnimation(
                        onTap: () {
                          func2();
                        },
                          child: Icon(bol2 ? Icons.info_outline : Icons.info)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: cardholderNameController,
              decoration: InputDecoration(
                labelText: "Enter cardholder's full name",
                hintText: "Enter cardholder's full name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                ZoomTapAnimation(
                  onTap: () {
                    func();
                  },
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      bol ? Icons.check : Icons.check_circle_outline,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                ),
                Text("  Save card"),
              ],
            ),
            SizedBox(height: 16),
            ZoomTapAnimation(
              onTap: () {},
              child: Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (contex) => CardClass(
                                cardNumber: cardNumberController.text,
                                expiryDate: expiryDateController.text,
                                cvc: cvcController.text,
                                cardholderName:
                                    cardholderNameController.text)));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    "Add card",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
