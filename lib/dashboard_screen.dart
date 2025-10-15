import 'package:flutter/material.dart';
import 'stock_card.dart';

final stocks = [
  {"symbol": "GOLDBEES", "price": 100.67, "change": -0.80, "percent": -0.78},
  {"symbol": "HDFCBANK", "price": 980.90, "change": 3.80, "percent": 0.38},
  {"symbol": "HINDUNILVR", "price": 2528.90, "change": 11.30, "percent": 0.44},
  {"symbol": "INFY", "price": 1514.90, "change": 5.60, "percent": 0.37},
  {"symbol": "ONGC", "price": 246.34, "change": 2.95, "percent": 1.21},
  {"symbol": "TCS", "price": 3028.30, "change": -33.40, "percent": -1.0},
];

double getResponsiveScale(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  if (width >= 1000) return 1.3;
  if (width >= 700) return 1.13;
  return width / 375.0;
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedIndex = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final scale = getResponsiveScale(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70 * scale),
        child: AppBar(
          backgroundColor: const Color.fromARGB(206, 224, 224, 224),
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 12 * scale, vertical: 8 * scale),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left NIFTY section
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('NIFTY 50',
                          style: TextStyle(
                              fontSize: 13 * scale, color: Colors.black)),
                      SizedBox(height: 2 * scale),
                      Row(
                        children: [
                          Text('25,285.35',
                              style: TextStyle(
                                  fontSize: 13 * scale, color: Colors.green)),
                          Text(' +103.55(+0.41%)',
                              style: TextStyle(
                                  fontSize: 13 * scale, color: Colors.grey)),
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  // Right BANK section
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('NIFTY BANK',
                          style: TextStyle(
                              fontSize: 13 * scale, color: Colors.black)),
                      SizedBox(height: 2 * scale),
                      Row(
                        children: [
                          Text('56,609.75',
                              style: TextStyle(
                                  fontSize: 13 * scale, color: Colors.green)),
                          Text(' +',
                              style: TextStyle(
                                  fontSize: 13 * scale, color: Colors.grey)),
                        ],
                      )
                    ],
                  ),
                  SizedBox(width: 2 * scale),
                  // Icons
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
          // Watchlist Tabs
          Container(
            height: 34 * scale,
            color: const Color.fromARGB(206, 224, 224, 224),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 15 * scale),
              itemCount: 7,
              itemBuilder: (context, index) {
                bool isSelected = index == selectedIndex;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                    pageController.animateToPage(index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 15 * scale),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Watchlist ${index + 1}',
                          style: TextStyle(
                            fontSize: 17 * scale,
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
                            borderRadius: BorderRadius.circular(1.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Search & Add Bar
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 14 * scale, vertical: 7 * scale),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0 * scale),
                    child: const Icon(Icons.search, color: Colors.grey),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search & add',
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10 * scale),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('6/100',
                        style: TextStyle(
                            color: Colors.grey, fontSize: 12 * scale)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('|',
                        style: TextStyle(
                            color: Colors.grey, fontSize: 12 * scale)),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.filter_list_alt, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),

          // Stock List / Empty Message
          Expanded(
            child: selectedIndex == 0
                ? ListView.separated(
                    padding: EdgeInsets.symmetric(vertical: 8 * scale),
                    itemCount: stocks.length,
                    separatorBuilder: (_, __) =>
                        Divider(color: Colors.grey, thickness: 0.4),
                    itemBuilder: (context, index) {
                      final stock = stocks[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 14 * scale, vertical: 4 * scale),
                        child: StockCard(
                          symbol: stock["symbol"] as String,
                          price: stock["price"] as double,
                          change: stock["change"] as double,
                          percent: stock["percent"] as double,
                        ),
                      );
                    },
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Nothing here",
                          style: TextStyle(
                            fontSize: 18 * scale,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 6 * scale),
                        Text(
                          "Use the search bar to add instruments to your watchlist.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13 * scale,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
