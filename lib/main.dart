import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import 'page2.dart';
import 'page3.dart';
import 'page4.dart';
import 'page5.dart';
import 'details.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyWidget(),
    ),
  );
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int selectedPos = 2;
  late CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    _navigationController = CircularBottomNavigationController(selectedPos);
  }

  @override
  void dispose() {
    _navigationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getSelectedPage(),
      bottomNavigationBar: CircularBottomNavigation(
        [
          TabItem(Icons.trending_up, "", Colors.blue),
          TabItem(CupertinoIcons.heart, "", Colors.blue),
          TabItem(Icons.home_outlined, "", Colors.blue),
          TabItem(CupertinoIcons.shopping_cart, "", Colors.blue),
          TabItem(CupertinoIcons.settings, "", Colors.blue),
        ],
        controller: _navigationController,
        selectedCallback: (selectedIdex) {
          setState(() {
            selectedPos = selectedIdex!; // Corrected here
          });
        },
      ),
    );
  }

  // Method to get the page based on the selected position
  Widget _getSelectedPage() {
    switch (selectedPos) {
      case 0:
        return const Page2(); // 1-sahifa
      case 1:
        return const Page3(); // 2-sahifa
      case 2:
        return const Page1(); // 3-sahifa
      case 3:
        return Page4(); // 4-sahifa
      case 4:
        return Page5(); // 5-sahifa
      default:
        return const Center(child: Text('Bosh sahifa')); // Default holat
    }
  }
}

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  List<DataClass> list1 = [
    DataClass(
        height: 255,
        apir: "A apir",
        name: "Blue",
        path: "images/krasovka.png",
        color1: Colors.blue,
        price: "\$ 220.",
        about:
            "Nike, Inc. is an American athletic footwear and apparel corporation headquartered near Beaverton, Oregon, United States."),
    DataClass(
        height: 222,
        name: "Black",
        apir: "A apir",
        path: "images/krasovka.png",
        color1: Colors.green,
        price: "\$ 220.",
        about:
            "Nike, Inc. is an American athletic footwear and apparel corporation headquartered near Beaverton, Oregon, United States."),
    DataClass(
        height: 255,
        name: "Red",
        apir: "A apir",
        path: "images/krasovka.png",
        color1: Colors.yellow,
        price: "\$ 220.",
        about:
            "Nike, Inc. is an American athletic footwear and apparel corporation headquartered near Beaverton, Oregon, United States."),
    DataClass(
        height: 222,
        name: "Amber",
        apir: "A apir",
        path: "images/krasovka.png",
        color1: Colors.pink,
        price: "\$ 220.",
        about:
            "Nike, Inc. is an American athletic footwear and apparel corporation headquartered near Beaverton, Oregon, United States."),
    DataClass(
        height: 255,
        name: "White",
        apir: "A apir",
        path: "images/krasovka.png",
        color1: Colors.brown,
        price: "\$ 220.",
        about:
            "Nike, Inc. is an American athletic footwear and apparel corporation headquartered near Beaverton, Oregon, United States."),
  ];

  List<DataClass> list2 = [
    DataClass(
        height: 222,
        name: "Delfin",
        apir: "A apir",
        path: "images/krasovka.png",
        color1: Colors.pink,
        price: "\$ 220.",
        about:
            "Nike, Inc. is an American athletic footwear and apparel corporation headquartered near Beaverton, Oregon, United States."),
    DataClass(
        height: 255,
        name: "Amber",
        apir: "A apir",
        path: "images/krasovka.png",
        color1: Colors.brown,
        price: "\$ 220.",
        about:
            "Nike, Inc. is an American athletic footwear and apparel corporation headquartered near Beaverton, Oregon, United States."),
    DataClass(
        height: 222,
        name: "Neon",
        apir: "A apir",
        path: "images/krasovka.png",
        color1: Colors.green,
        price: "\$ 220.",
        about:
            "Nike, Inc. is an American athletic footwear and apparel corporation headquartered near Beaverton, Oregon, United States."),
    DataClass(
        height: 255,
        apir: "A apir",
        name: "Grey",
        path: "images/krasovka.png",
        color1: Colors.blue,
        price: "\$ 220.",
        about:
            "Nike, Inc. is an American athletic footwear and apparel corporation headquartered near Beaverton, Oregon, United States."),
    DataClass(
        height: 222,
        apir: "A apir",
        name: "Brown",
        path: "images/krasovka.png",
        color1: Colors.red,
        price: "\$ 220.",
        about:
            "Nike, Inc. is an American athletic footwear and apparel corporation headquartered near Beaverton, Oregon, United States."),
  ];

  List<DataClass> filteredList1 = [];
  List<DataClass> filteredList2 = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredList1 = list1;
    filteredList2 = list2;
    searchController.addListener(_filterData);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _filterData() {
    String searchQuery = searchController.text.toLowerCase();
    setState(() {
      filteredList1 = list1
          .where((item) => item.name!.toLowerCase().contains(searchQuery))
          .toList();
      filteredList2 = list2
          .where((item) => item.name!.toLowerCase().contains(searchQuery))
          .toList();
    });
  }

  Widget Design(DataClass data) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      child: ZoomTapAnimation(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Details(
                        data: data,
                      )));
        },
        child: Container(
          height: data.height!,
          width: 167,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 10,
                child: Container(
                  height: 250,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    color: data.color1,
                  ),
                  child: Stack(
                    children: [],
                  ),
                ),
              ),
              Positioned(
                right: -25,
                top: 35,
                child: Container(
                  height: 150,
                  width: 150,
                  child: Image(
                    image: AssetImage(data.path!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 15,
                right: 20,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      data.price!,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "00",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                    )
                  ],
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Text(
                  data.name!,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
              ),
              Positioned(
                top: 33,
                left: 13,
                child: Text(
                  data.apir!,
                  style: TextStyle(fontSize: 13),
                ),
              ),
              Positioned(
                right: 25,
                top: 12,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 13,
                  child: Icon(
                    Icons.check_circle_outline,
                    color: Colors.greenAccent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: nikeText,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 22, top: 20, right: 22),
              child: searchContainer(),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 8,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children:
                            filteredList1.map((val) => Design(val)).toList(),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children:
                            filteredList2.map((val) => Design(val)).toList(),
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

  Container searchContainer() {
    return Container(
      height: 47,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        boxShadow: const [
          BoxShadow(offset: Offset(0, 2.3), blurRadius: 4, color: Colors.grey),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 17),
        child: TextField(
          controller: searchController,
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                CupertinoIcons.search,
                color: Colors.grey.shade600,
              ),
              hintText: "Search by name",
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 20)),
        ),
      ),
    );
  }
}

class DataClass {
  double? height;
  Color? color1;
  String? apir;
  String? path;
  String? price;
  String? name;
  String? about;
  DataClass(
      {this.height,
      this.color1,
      this.apir,
      this.path,
      this.price,
      this.name,
      this.about});
}

AppBar _appBar = AppBar(
  leading: Icon(Icons.arrow_back_ios),
  actions: [
    Icon(
      Icons.menu,
      size: 32,
    ),
    Text("    ")
  ],
);

Text nikeText = Text(
  "Nike shoe store",
  style:
      TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 27),
);

Container searchContainer = Container(
  height: 47,
  width: double.infinity,
  decoration: BoxDecoration(
    color: Colors.grey.shade200,
    borderRadius: const BorderRadius.all(
      Radius.circular(12),
    ),
    boxShadow: const [
      BoxShadow(offset: Offset(0, 2.3), blurRadius: 4, color: Colors.grey),
    ],
  ),
  child: Padding(
    padding: const EdgeInsets.only(left: 17),
    child: TextField(
      decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            CupertinoIcons.search,
            color: Colors.grey.shade600,
          ),
          hintText: " search",
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 20)),
    ),
  ),
);
