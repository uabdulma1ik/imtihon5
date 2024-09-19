import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imtihon5/addCard.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import 'main.dart';

class Details extends StatefulWidget {
  final DataClass data;
  const Details({super.key, required this.data});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.data.color1,
      appBar: AppBar(
        backgroundColor: widget.data.color1,
        actions: [
          Icon(
            Icons.menu,
            color: Colors.black,
            size: 27,
          ),
          Text("    "),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              color: widget.data.color1,
              child: Center(
                child: Image(
                  image: AssetImage(widget.data.path!),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              alignment: Alignment.topLeft,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(22),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 30, top: 25),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.data.name! + " shoe",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 25),
                            ),
                            Text(
                              "1 Pair",
                              style: TextStyle(fontSize: 16.5),
                            ),
                          ],
                        ),
                        Expanded(child: Text("")),
                        Text(
                          widget.data.price! + "00",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 21,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    Expanded(child: Text("")),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Product Description",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          width: double.infinity,
                          child: Text(widget.data.about!),
                        ),
                      ],
                    ),
                    Expanded(child: Text("")),
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              border: Border.all(width: 2, color: Colors.blue)),
                          child: Icon(
                            CupertinoIcons.heart_fill,
                            color: Colors.blue,
                            size: 35,
                          ),
                        ),
                        Expanded(child: Text("")),
                        ZoomTapAnimation(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddCardScreen()));
                          },
                          child: Container(
                            height: 38,
                            alignment: Alignment.center,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: Colors.blue),
                            child: Text(
                              "Add to cart",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 35,
                    )
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
