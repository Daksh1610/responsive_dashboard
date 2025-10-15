import 'package:flutter/material.dart';

// Responsive scale function (copy this to your utils or top of the file)
double getResponsiveScale(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  if (width >= 1000) return 1.3;
  if (width >= 700) return 1.13;
  return width / 375.0;
}

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int selectedIndex = 0;
  PageController pageController = PageController();

  final List<String> tabs = [
    "Open",
    "Executed",
    "GTT",
    "Baskets",
    "SIPs",
    "Alerts"
  ];

  @override
  Widget build(BuildContext context) {
    final scale = getResponsiveScale(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70 * scale),
        child: AppBar(
          backgroundColor: Color.fromARGB(206, 224, 224, 224),
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 12 * scale, vertical: 8 * scale),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'NIFTY 50',
                        style: TextStyle(
                            fontSize: 13 * scale, color: Colors.black),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 2 * scale),
                      Row(
                        children: [
                          Text(
                            '25,285.35',
                            style: TextStyle(
                                fontSize: 13 * scale, color: Colors.green),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            ' +103.55(+0.41%)',
                            style: TextStyle(
                                fontSize: 13 * scale, color: Colors.grey),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'NIFTY BANK',
                        style: TextStyle(
                            fontSize: 13 * scale, color: Colors.black),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 2 * scale),
                      Row(
                        children: [
                          Text(
                            '56,609.75',
                            style: TextStyle(
                                fontSize: 13 * scale, color: Colors.green),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            ' +',
                            style: TextStyle(
                                fontSize: 13 * scale, color: Colors.grey),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(width: 2 * scale),
                  Row(
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(Icons.shopping_cart_outlined,
                            color: Colors.black, size: 20 * scale),
                        onPressed: () {},
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(Icons.arrow_downward_outlined,
                            color: Colors.black, size: 20 * scale),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 40 * scale,
            color: const Color.fromARGB(206, 224, 224, 224),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 20 * scale),
              itemCount: tabs.length,
              itemBuilder: (context, index) {
                bool isSelected = index == selectedIndex;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                    pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 27 * scale),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          tabs[index],
                          style: TextStyle(
                            fontSize: 18 * scale,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: isSelected ? Colors.blue : Colors.black,
                          ),
                        ),
                        SizedBox(height: 5 * scale),
                        Container(
                          height: 2 * scale,
                          width: 35 * scale,
                          decoration: BoxDecoration(
                            color:
                                isSelected ? Colors.blue : Colors.transparent,
                            borderRadius: BorderRadius.circular(1.5 * scale),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // 🔹 Page content
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              children: tabs.map((tab) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "No pending orders",
                        style: TextStyle(
                            fontSize: 20 * scale,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5 * scale),
                      Text(
                        "Place an order from your watchlist",
                        style:
                            TextStyle(color: Colors.grey, fontSize: 16 * scale),
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
