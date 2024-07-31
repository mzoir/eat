import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:url_launcher/url_launcher.dart';

import 'f.dart';

import "package:eat/viewmodel/UserViewModel.dart";


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  bool? isFav = false;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  String? selectedPage;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromRGBO(210, 228, 232, 1),
      appBar: AppBar(
        title: Text(
          'food',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 10,
        backgroundColor: Colors.white,
        foregroundColor: Colors.blueGrey,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.share,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      drawer: _menu(),

      body: _buildBody(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueGrey,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget Hompage() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 170,
            child: Container(
              color: Colors.white,
              height: 170,
              width: double.infinity,
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Best Food',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Raleway',
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'Looking for:',
                    style: TextStyle(
                      color: Colors.brown,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Raleway',
                      fontSize: 26,
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.greenAccent, width: 5.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 5.0),
                      ),
                      labelText: 'Search',
                      labelStyle: TextStyle(color: Colors.blue),
                      hintText: 'Enter your keyword',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: ListTile(
              leading: Text(
                'Available Foods:',
                style: TextStyle(
                  color: Colors.brown,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Raleway',
                  fontSize: 23,
                ),
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  // Add your onPressed code here!
                },
                child: Text('View All'),
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 250,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                image('images/mpl.jfif'),
                image('images/download.jfif'),
                image('images/OIP.jfif'),
                image('images/mpl.jfif'),
                image('images/mpl.jfif'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: ListTile(
              leading: Text(
                'plus commandés:',
                style: TextStyle(
                  color: Colors.brown,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Raleway',
                  fontSize: 23,
                ),
              ),
            ),
          ),
          Container(
            height: 200,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                image('images/mpl.jfif'),
                image('images/download.jfif'),
                image('images/OIP.jfif'),
                image('images/mpl.jfif'),
                image('images/mpl.jfif'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget image(String imagePath) {
    bool? isFav = false;
    return SingleChildScrollView(child : Column(crossAxisAlignment: CrossAxisAlignment.end,
      children: [
         Container(
            width: 170,
            height: 150,
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
            color: Colors.red,
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        FavoriteButton(),
        ],
    ), );
  }

  Widget _buildBody(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return Hompage();
      case 1:
        return ProfileScreen();
      default:
        return Hompage();
    }
  }
  Widget _menu(){
    return Drawer(
      width: 300,
      elevation: 1.0,

      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 100,
            child: const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(210, 228, 232, 1),
                gradient: LinearGradient(
                  colors: [Color.fromRGBO(210, 228, 232, 1),Color.fromRGBO(210, 228, 232, 1),],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Menu',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Raleway',
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.blue),
            leading: const Icon(Icons.hotel, color: Colors.blue),
            title: const Text(
              'Favorite Hotels',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color(0xff0a0a0a),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              setState(() {
                selectedPage = 'favhotel';

              });
            },
          ),
          const Divider(
            height: 20,
            thickness: 1,
            endIndent: 10,
            indent: 10,
            color: Color(0x319c9292),
          ),
          ListTile(
            trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.blue),
            leading: const Icon(Icons.attractions, color: Colors.blue),
            title: const Text(
              'Favorite Attractions',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color(0xff090909),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              setState(() {
                selectedPage = 'favattraction';

              });
            },
          ),
          const Divider(
            height: 20,
            thickness: 1,
            endIndent: 10,
            indent: 10,
            color: Color(0x319c9292),
          ),
          ListTile(
            trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.blue),
            leading: const Icon(Icons.settings, color: Colors.blue),
            title: const Text(
              'Settings',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              setState(() {
                selectedPage = 'Settings';


              });
            },
          ),
          const Divider(
            height: 20,
            thickness: 1,
            endIndent: 10,
            indent: 10,
            color: Color(0x319c9292),
          ),
          ListTile(
            trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.blue),
            leading: const Icon(Icons.home, color: Colors.blue),
            title: const Text(
              'Close Drawer',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            onTap: () {
              setState(() {
                selectedPage = 'close it';
                Navigator.pop(context); // Close the drawer
              });
            },
          ),
          const Divider(
            height: 20,
            thickness: 1,
            endIndent: 10,
            indent: 10,
            color: Color(0x319c9292),
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app, color: Colors.blue),

            trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.blue),
            title: const Text(
              'Help',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              setState(() {
                selectedPage = 'Help';
                SystemNavigator.pop();
              });
            },
          ),
          const Divider(
            height: 20,
            thickness: 1,
            endIndent: 10,
            indent: 10,
            color: Color(0x319c9292),
          ),
          ListTile(
            trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.blue),
            leading: const Icon(Icons.contact_support, color: Colors.blue),
            title: const Text(
              'Contact Us',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              setState(() {
                selectedPage = 'Contact us';
              });
              final url = "tel:+212620018359";
              print('linkl');
              Future<void> _launchUrl(url) async {
                if (!await launch(url)) {
                  throw Exception('Could not launch $url');
                };
              };
            },
          ),
          const Divider(
            height: 20,
            thickness: 1,
            endIndent: 10,
            indent: 10,
            color: Color(0x319c9292),
          ),
          ListTile(
            trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.blue),
            leading: const Icon(Icons.logout, color: Colors.blue),
            title: const Text(
              'Log Out',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            onTap: () {
              final auth = Provider.of<UserViewModel>(context, listen: false);

              setState(() {

                selectedPage = 'Log_out';

              });
            },
          ),
          const Divider(
            height: 20,
            thickness: 1,
            endIndent: 10,
            indent: 10,
            color: Color(0x319c9292),
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app, color: Colors.blue),
            title: const Text(
              'Exit',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              setState(() {
                selectedPage = 'exit';
                SystemNavigator.pop();
              });
            },
          ),
          const Divider(
            height: 20,
            thickness: 1,
            endIndent: 10,
            indent: 10,
            color: Color(0x319c9292),
          ),
        ],
      ),
    );

  }

}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Profile Screen',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
