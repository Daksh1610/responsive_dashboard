import 'package:flutter/material.dart';
import 'package:responsive_dashboard/profile_page.dart';
import 'package:responsive_dashboard/setting.dart';

double getResponsiveScale(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  if (width >= 1000) return 1.3;
  if (width >= 700) return 1.13;
  return width / 375.0;
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Widget buildMenuTile(BuildContext context, IconData icon, String title,
      {Widget? page, bool isLogout = false, required double scale}) {
    return Container(
      color: Colors.white,
      child: ListTile(
        leading: Icon(icon, color: Colors.black54, size: 22 * scale),
        title: Text(title, style: TextStyle(fontSize: 15 * scale)),
        trailing: Icon(Icons.chevron_right,
            color: Colors.grey[400], size: 20 * scale),
        onTap: () {
          if (isLogout) {
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: const Text('Logout'),
                content: const Text('Are you sure you want to logout?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Logout'),
                  ),
                ],
              ),
            );
          } else if (page != null) {
            Navigator.push(context, MaterialPageRoute(builder: (_) => page));
          }
        },
      ),
    );
  }

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
                      )
                    ],
                  ),
                  const Spacer(),
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
      body: Stack(
        children: [
          Container(
            height: 100 * scale,
            color: const Color.fromARGB(206, 224, 224, 224),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16 * scale),
              child: Column(
                children: [
                  SizedBox(height: 4 * scale),
                  Row(
                    children: [
                      Text('Daksh Verma',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20 * scale,
                              color: Colors.black)),
                      const Spacer(),
                      Icon(Icons.notifications_none_outlined,
                          color: Colors.black, size: 25 * scale),
                    ],
                  ),
                  SizedBox(height: 10 * scale),
                  Container(
                    padding: EdgeInsets.all(15 * scale),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14 * scale),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 8,
                            offset: Offset(0, 3))
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 26 * scale,
                              backgroundColor: Colors.blue[50],
                              child: Text('DV',
                                  style: TextStyle(
                                      fontSize: 22 * scale,
                                      color: Colors.blue)),
                            ),
                            SizedBox(width: 14 * scale),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('EOP507',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16 * scale)),
                                  SizedBox(height: 2 * scale),
                                  Text('vermadaksh01@gmail.com',
                                      style: TextStyle(
                                          fontSize: 15 * scale,
                                          color: Colors.grey.shade700)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 18 * scale),
                        Container(
                          height: 50 * scale,
                          decoration: BoxDecoration(
                            color: const Color(0xfff7f8fa),
                            borderRadius: BorderRadius.circular(14 * scale),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 18 * scale),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Text('Privacy mode',
                                      style: TextStyle(fontSize: 15 * scale))),
                              Switch(value: false, onChanged: (_) {})
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 14 * scale),
                  buildMenuTile(context, Icons.person_outline, "Profile",
                      page: const ProfilePage(), scale: scale),
                  buildMenuTile(
                      context, Icons.account_balance_wallet_outlined, "Funds",
                      page: const FundsPage(), scale: scale),
                  buildMenuTile(context, Icons.lock_outline, "App Code",
                      page: const AppCodePage(), scale: scale),
                  buildMenuTile(context, Icons.settings_outlined, "Settings",
                      page: const SettingsPage(), scale: scale),
                  buildMenuTile(context, Icons.apps_outlined, "Connected apps",
                      page: const DummyPage(title: "Connected apps"),
                      scale: scale),
                  buildMenuTile(
                      context, Icons.support_agent_outlined, "Support Portal",
                      page: const DummyPage(title: "Support Portal"),
                      scale: scale),
                  buildMenuTile(
                      context, Icons.phone_in_talk_outlined, "Contact",
                      page: const DummyPage(title: "Contact"), scale: scale),
                  buildMenuTile(context, Icons.logout, "Logout",
                      isLogout: true, scale: scale),
                  SizedBox(height: 10 * scale),
                  Column(
                    children: [
                      Text("Kite version 4.0.0",
                          style: TextStyle(
                              fontSize: 18 * scale, color: Colors.grey)),
                      SizedBox(height: 4 * scale),
                      Text("Zerodha",
                          style: TextStyle(
                              fontSize: 18 * scale,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54)),
                      SizedBox(height: 20 * scale),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DummyPage extends StatelessWidget {
  final String title;
  const DummyPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final scale = getResponsiveScale(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 18 * scale)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.5,
      ),
      body: Center(
        child: Text("$title Page",
            style:
                TextStyle(fontSize: 18 * scale, fontWeight: FontWeight.w500)),
      ),
    );
  }
}
