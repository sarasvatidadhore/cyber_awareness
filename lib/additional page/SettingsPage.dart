import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Settings',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            _buildSettingItem(
              title: 'Notification Settings',
              icon: Icons.notifications,
              onTap: () {
                // Navigate to notification settings page
                Navigator.pushNamed(context, '/notification_settings');
              },
            ),
            Divider(),
            _buildSettingItem(
              title: 'Privacy Settings',
              icon: Icons.lock,
              onTap: () {
                // Navigate to privacy settings page
                Navigator.pushNamed(context, '/privacy_settings');
              },
            ),
            Divider(),
            _buildSettingItem(
              title: 'Language Settings',
              icon: Icons.language,
              onTap: () {
                // Navigate to language settings page
                Navigator.pushNamed(context, '/language_settings');
              },
            ),
            Divider(),
            _buildSettingItem(
              title: 'About',
              icon: Icons.info,
              onTap: () {
                // Navigate to about page
                Navigator.pushNamed(context, '/about');
              },
            ),
            Divider(),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }
}
