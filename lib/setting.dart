import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notificationEnabled = true;
  bool darkModeEnabled = false;
  bool showEnabled = false;
  bool locationEnabled = false;
  bool rememberEnabled = false;

  Widget buildSwitchTile(
      String title, bool value, ValueChanged<bool> onChanged) {
    return SwitchListTile(
      title: Text(title, style: TextStyle(fontSize: 16)),
      value: value,
      onChanged: onChanged,
      activeColor: Colors.blue,
    );
  }

  Widget buildMenuTile(String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.black54),
      title: Text(title, style: TextStyle(fontSize: 16)),
      trailing: Icon(Icons.chevron_right, color: Colors.grey[400]),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Settings',
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.5,
      ),
      body: ListView(
        children: [
          Divider(thickness: 1),
          buildSwitchTile('Dark Mode', darkModeEnabled, (val) {
            setState(() {
              darkModeEnabled = val;
            });
          }),
          buildSwitchTile('Enable Notifications', notificationEnabled, (val) {
            setState(() {
              notificationEnabled = val;
            });
          }),
          buildSwitchTile('Show watchlist notes', showEnabled, (val) {
            setState(() {
              showEnabled = val;
            });
          }),
          buildSwitchTile('Location Access', locationEnabled, (val) {
            setState(() {
              locationEnabled = val;
            });
          }),
          buildSwitchTile('Remember F&O order quantuty', rememberEnabled,
              (val) {
            setState(() {
              rememberEnabled = val;
            });
          }),
          Divider(thickness: 1),
          buildMenuTile('Account Settings', Icons.person, () {
            // Navigate to account settings page
          }),
          buildMenuTile('About', Icons.info_outline, () {
            // Navigate to about page
          }),
          buildMenuTile('Help & Support', Icons.help_outline, () {
            // Navigate to help and support
          }),
        ],
      ),
    );
  }
}

class AppCodePage extends StatelessWidget {
  const AppCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('App Code',
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.5,
      ),
      body: Center(
        child: Text(
          "Your app code is:\nEOP507",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
      ),
    );
  }
}

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  Widget buildMenuTile(
      BuildContext context, IconData icon, String title, Widget page) {
    return Container(
      color: Colors.white,
      child: ListTile(
        leading: Icon(icon, color: Colors.black54),
        title: Text(title, style: const TextStyle(fontSize: 15)),
        trailing: Icon(Icons.chevron_right, color: Colors.grey[400]),
        onTap: () {
          if (title == "Logout") {
            showLogoutDialog(context);
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => page),
            );
          }
        },
      ),
    );
  }

  void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Confirm Logout"),
        content: const Text("Are you sure you want to logout?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              // Logout logic yahan daalein
              Navigator.of(context).pop(); // Close dialog
              Navigator.of(context).popUntil((route) =>
                  route.isFirst); // Navigate back to home / login screen
            },
            child: const Text("Logout"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

  // rest of your build and other UI code...
}
