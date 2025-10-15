import 'package:flutter/material.dart';

double getResponsiveScale(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  if (width >= 1000) return 1.3;
  if (width >= 700) return 1.13;
  return width / 375.0;
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  Widget infoRow(String label, String value,
      {Widget? trailing, required double scale}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6 * scale),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(label,
              style:
                  TextStyle(fontWeight: FontWeight.w600, fontSize: 16 * scale)),
          SizedBox(width: 20 * scale),
          Expanded(
            child: Text(value,
                style:
                    TextStyle(fontSize: 16 * scale, color: Colors.grey[700])),
          ),
          if (trailing != null) trailing,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final scale = getResponsiveScale(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Profile',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 18 * scale)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.5,
      ),
      body: ListView(
        padding: EdgeInsets.all(16 * scale),
        children: [
          Stack(
            children: [
              Center(
                child: CircleAvatar(
                  radius: 40 * scale,
                  backgroundColor: Colors.blue[50],
                  child: Text('DV',
                      style:
                          TextStyle(fontSize: 30 * scale, color: Colors.blue)),
                ),
              ),
            ],
          ),
          SizedBox(height: 10 * scale),
          Center(
            child: Text('Daksh Verma',
                style: TextStyle(
                    fontSize: 22 * scale, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 30 * scale),
          Container(
            padding: EdgeInsets.all(20 * scale),
            decoration: BoxDecoration(
              color: const Color(0xfff7f8fa),
              borderRadius: BorderRadius.circular(12 * scale),
            ),
            child: Column(
              children: [
                infoRow('User ID', 'XXXX12', scale: scale),
                Divider(),
                infoRow('E-mail', 'abc@gmail.com', scale: scale),
                Divider(),
                infoRow('Phone', '9876543210', scale: scale),
                Divider(),
                infoRow('PAN Number', 'ABCDE1234F', scale: scale),
                Divider(),
                infoRow('Bank Accounts', '*1234', scale: scale),
              ],
            ),
          ),
          SizedBox(height: 30 * scale),
          ListTile(
            leading: Icon(Icons.edit, size: 22 * scale),
            title: Text('Edit Profile', style: TextStyle(fontSize: 16 * scale)),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.lock, size: 22 * scale),
            title:
                Text('Change Password', style: TextStyle(fontSize: 16 * scale)),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class FundsPage extends StatelessWidget {
  const FundsPage({super.key});

  Widget buildInfoRow(String label, String value,
      {bool isBold = false, required double scale}) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: 10 * scale, horizontal: 16 * scale),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                  fontSize: 16 * scale)),
          Text(value,
              style: TextStyle(
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                  fontSize: 16 * scale)),
        ],
      ),
    );
  }

  Widget buildSectionDivider(double scale) {
    return Divider(
      thickness: 8 * scale,
      color: Colors.grey[200],
      height: 8 * scale,
    );
  }

  @override
  Widget build(BuildContext context) {
    final scale = getResponsiveScale(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Funds',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 18 * scale)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.5,
      ),
      backgroundColor: const Color(0xfff7f8fa),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16 * scale),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 20 * scale, horizontal: 16 * scale),
              child: Column(
                children: [
                  Text("Available margin (Cash + Collateral)",
                      style: TextStyle(
                          fontSize: 18 * scale, color: Colors.grey[600]),
                      textAlign: TextAlign.center),
                  SizedBox(height: 8 * scale),
                  Text("₹0.00",
                      style: TextStyle(
                          fontSize: 28 * scale,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue)),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.only(top: 10 * scale),
                      child: Text("View statement",
                          style: TextStyle(
                              fontSize: 14 * scale, color: Colors.blueAccent)),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 8 * scale),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16 * scale),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 48 * scale,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12 * scale),
                    ),
                    child: Center(
                      child: Text("+ Add funds",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16 * scale,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                ),
                SizedBox(width: 12 * scale),
                Expanded(
                  child: Container(
                    height: 48 * scale,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12 * scale),
                    ),
                    child: Center(
                      child: Text("Withdraw",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16 * scale,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 16 * scale),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60 * scale),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text("Available cash",
                        style: TextStyle(
                            fontSize: 16 * scale, color: Colors.grey[600])),
                    SizedBox(height: 5 * scale),
                    Text("0.00",
                        style: TextStyle(
                            fontSize: 18 * scale,
                            fontWeight: FontWeight.w600,
                            color: Colors.black)),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    Text("Used margin",
                        style: TextStyle(
                            fontSize: 14 * scale, color: Colors.grey[600])),
                    SizedBox(height: 5 * scale),
                    Text("0.00",
                        style: TextStyle(
                            fontSize: 18 * scale,
                            fontWeight: FontWeight.w600,
                            color: Colors.black)),
                  ],
                ),
              ],
            ),
          ),
          buildSectionDivider(scale),
          buildInfoRow("Opening balance", "0.00", isBold: true, scale: scale),
          buildInfoRow("Payin", "0.00", scale: scale),
          buildInfoRow("Payout", "0.00", scale: scale),
          buildInfoRow("SPAN", "0.00", scale: scale),
          buildInfoRow("Delivery margin", "0.00", scale: scale),
          buildInfoRow("Exposure", "0.00", scale: scale),
          buildInfoRow("Option premium", "0.00", scale: scale),
          buildSectionDivider(scale),
          buildInfoRow("Collateral (Liquid funds)", "0.00", scale: scale),
          buildInfoRow("Collateral (Equity)", "0.00", scale: scale),
          buildInfoRow("Total collateral", "0.00", scale: scale),
          SizedBox(height: 20 * scale),
        ],
      ),
    );
  }
}
