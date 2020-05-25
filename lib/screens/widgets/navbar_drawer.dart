import 'package:flutter/material.dart';

// import 'package:Easyomu/constants/global.dart';
// import 'package:Easyomu/screens/privacy_policy.dart';
// import 'package:Easyomu/screens/terms_and_condition.dart';
// import 'package:Easyomu/screens/content_in_webview.dart';
// import 'package:Easyomu/styles/NavigationStyles.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth / 1.5,
      child: Drawer(
        child: ListView(
          children: <Widget>[
            // Navigation bar content
            Container(
              height: screenHeight / 6,
              child: DrawerHeader(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'Thingszilla',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Devices',
              ),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => NewsInWebView(
                //         webViewUrl: "https://medium.com/",
                //         title: 'Privacy Policy'),
                //   ),
                // );
              },
            ),
            ListTile(
              title: Text(
                'Reports',
              ),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => NewsInWebView(
                //         webViewUrl: "https://medium.com/",
                //         title: 'Terms & Conditions'),
                //   ),
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}
