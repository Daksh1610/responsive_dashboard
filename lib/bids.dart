import 'package:flutter/material.dart';

// Responsive Scale Function
double getResponsiveScale(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  if (width >= 1000) return 1.3;
  if (width >= 700) return 1.13;
  return width / 375.0;
}

class BidsScreen extends StatefulWidget {
  @override
  _BidsScreenState createState() => _BidsScreenState();
}

class _BidsScreenState extends State<BidsScreen> with TickerProviderStateMixin {
  int selectedIndex = 0;
  PageController pageController = PageController();

  final List<String> mainTabs = ['IPO', 'Govt. securities', 'Auctions'];

  final List<Map<String, String>> ipoDataOngoing = [
    {
      "category": "Midwest",
      "title": "MIDWESTLTD",
      "range": "₹1014 - ₹1065",
      "status": "Pre-apply",
      "date": "15th - 17th Oct",
    },
    {
      "category": "Trualt Bioenergy",
      "title": "TRUALT",
      "range": "₹472 - ₹496",
      "status": "Closed",
      "date": "25th - 29th Sep",
    },
    {
      "category": "Jinkushal Industries",
      "title": "JKIPL",
      "range": "₹115 - ₹121",
      "status": "Closed",
      "date": "25th - 29th Sep",
    },
    {
      "category": "Pace Digitek",
      "title": "PACEDIGITK",
      "range": "₹208 - ₹219",
      "status": "Closed",
      "date": "26th - 30th Sep",
    },
    {
      "category": "Fabtech Technologies",
      "title": "FABTECH",
      "range": "₹181 - ₹191",
      "status": "Closed",
      "date": "29th Sep - 1st Oct",
    },
    {
      "category": "Glottis",
      "title": "GLOTTIS",
      "range": "₹120 - ₹129",
      "status": "Closed",
      "date": "29th Sep - 1th Oct",
    },
    {
      "category": "Advance Agrolife",
      "title": "ADVANCE",
      "range": "₹95 - ₹100",
      "status": "Closed",
      "date": "30th Sep - 3rd Oct",
    },
  ];

  final List<Map<String, String>> govtSecurities = [
    {
      "category": "Govt. Bond",
      "title": "GOVT2050",
      "range": "₹1000 - ₹1050",
      "status": "Open",
      "date": "Jan 2025 - Dec 2050",
    },
    {
      "category": "Gold Bond",
      "title": "GOLD2025",
      "range": "₹500 - ₹550",
      "status": "Open",
      "date": "Jan 2025 - Dec 2025",
    },
  ];

  PreferredSizeWidget buildCommonAppBar(double scale) {
    return PreferredSize(
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
                    Text('NIFTY 50',
                        style: TextStyle(
                            fontSize: 13 * scale, color: Colors.black),
                        overflow: TextOverflow.ellipsis),
                    SizedBox(height: 2 * scale),
                    Row(
                      children: [
                        Text('25,285.35',
                            style: TextStyle(
                                fontSize: 13 * scale, color: Colors.green),
                            overflow: TextOverflow.ellipsis),
                        Text(' +103.55(+0.41%)',
                            style: TextStyle(
                                fontSize: 13 * scale, color: Colors.grey),
                            overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('NIFTY BANK',
                        style: TextStyle(
                            fontSize: 13 * scale, color: Colors.black),
                        overflow: TextOverflow.ellipsis),
                    SizedBox(height: 2 * scale),
                    Row(
                      children: [
                        Text('56,609.75',
                            style: TextStyle(
                                fontSize: 13 * scale, color: Colors.green),
                            overflow: TextOverflow.ellipsis),
                        Text(' +',
                            style: TextStyle(
                                fontSize: 13 * scale, color: Colors.grey),
                            overflow: TextOverflow.ellipsis),
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
                        onPressed: () {}),
                    IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(Icons.arrow_downward_outlined,
                            color: Colors.black, size: 20 * scale),
                        onPressed: () {}),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildMainTabBar(double scale) {
    return Container(
      height: 40 * scale,
      color: Color.fromARGB(206, 224, 224, 224),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 30 * scale),
        itemCount: mainTabs.length,
        itemBuilder: (context, index) {
          bool isSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              pageController.animateToPage(index,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut);
            },
            child: Padding(
              padding: EdgeInsets.only(right: 30 * scale, left: 10 * scale),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    mainTabs[index],
                    style: TextStyle(
                        fontSize: 18 * scale,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                        color: isSelected ? Colors.blue : Colors.black),
                  ),
                  SizedBox(height: 5 * scale),
                  Container(
                    height: 2 * scale,
                    width: 35 * scale,
                    decoration: BoxDecoration(
                        color: isSelected ? Colors.blue : Colors.transparent,
                        borderRadius: BorderRadius.circular(1.5 * scale)),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildIpoList(double scale) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: ipoDataOngoing.length,
      separatorBuilder: (context, index) =>
          Divider(height: 1 * scale, color: Colors.grey.shade300),
      itemBuilder: (context, index) {
        var item = ipoDataOngoing[index];
        return Padding(
          padding: EdgeInsets.symmetric(
              vertical: 10 * scale, horizontal: 14 * scale),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item['category'] ?? '',
                  style: TextStyle(
                      color: Colors.grey.shade500, fontSize: 15 * scale)),
              SizedBox(height: 6 * scale),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item['title'] ?? '',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16 * scale)),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10 * scale, vertical: 4 * scale),
                    decoration: BoxDecoration(
                      color: item['status'] == 'Pre-apply'
                          ? Colors.blue
                          : Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8 * scale),
                    ),
                    child: Text(
                      item['status']!.toUpperCase(),
                      style: TextStyle(
                        color: item['status'] == 'Pre-apply'
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 13 * scale,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6 * scale),
              Row(
                children: [
                  Text(item['range'] ?? '',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14 * scale)),
                  Spacer(),
                  Text(item['date'] ?? '',
                      style: TextStyle(
                          color: Colors.grey.shade600, fontSize: 12 * scale)),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildGovtSecurityList(double scale) {
    return ListView.separated(
      padding:
          EdgeInsets.symmetric(vertical: 8 * scale, horizontal: 14 * scale),
      itemCount: govtSecurities.length,
      separatorBuilder: (context, index) =>
          Divider(color: Colors.grey.shade300, thickness: 1 * scale),
      itemBuilder: (context, index) {
        var item = govtSecurities[index];
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10 * scale),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item['category'] ?? '',
                  style: TextStyle(
                      color: Colors.grey.shade500, fontSize: 13 * scale)),
              SizedBox(height: 5 * scale),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item['title'] ?? '',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16 * scale)),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10 * scale, vertical: 4 * scale),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(8 * scale),
                    ),
                    child: Text(
                      item['status']!.toUpperCase(),
                      style: TextStyle(
                          color: Colors.green.shade700,
                          fontWeight: FontWeight.w600,
                          fontSize: 13 * scale),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4 * scale),
              Text(item['range'] ?? '',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14 * scale)),
              SizedBox(height: 2 * scale),
              Text(item['date'] ?? '',
                  style: TextStyle(
                      color: Colors.grey.shade600, fontSize: 12 * scale)),
            ],
          ),
        );
      },
    );
  }

  Widget buildBody(double scale) {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
      children: [
        buildIpoList(scale),
        buildGovtSecurityList(scale),
        Center(
          child: Text(
            'No Stocks for auction',
            style: TextStyle(fontSize: 16 * scale, color: Colors.grey),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final scale = getResponsiveScale(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildCommonAppBar(scale),
      body: Column(
        children: [
          buildMainTabBar(scale),
          Expanded(child: buildBody(scale)),
        ],
      ),
    );
  }
}
