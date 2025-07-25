import 'package:flutter/material.dart';
import 'home_page.dart';
import 'main.dart'; // Import home_page.dart to get access to the shared content widgets.

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {final ButtonStyle navLinkStyle = TextButton.styleFrom(
    foregroundColor: Colors.black,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
    textStyle: const TextStyle(fontSize: 15),
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14))),
  ).copyWith(
    overlayColor: WidgetStateProperty.all(const Color(0xFFE3D5E8)),
    foregroundColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
        if (states.contains(WidgetState.hovered)) {
          return Theme.of(context).primaryColor;
        }
        return Colors.black;
      },
    ),
  );
  var wid = MediaQuery.of(context).size.width;
  var hei = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: appbgcol,
        foregroundColor: Colors.black,
        elevation: 1.0,
        toolbarHeight: 70,
        title: Row(children: [
          SizedBox(height: 70, width: 70, child: IconButton(onPressed: () => Navigator.pushNamed(context, '/'), icon: Image.asset("images/icon1.png"))),
          const SizedBox(width: 5),
          const Text('Login', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        ]),
        actions: (hei<wid*0.9)?<Widget>[
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/'),
            style: navLinkStyle,
            child: const Text('Home'),
          ),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/reviews'),
            style: navLinkStyle,
            child: const Text('Reviews'),
          ),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/about'),
            style: navLinkStyle,
            child: const Text('About Me'),
          ),
          const SizedBox(width: 10),
          OutlinedButton(
            onPressed: () => Navigator.pushNamed(context, '/contact'),
            child: const Text('Contact'),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.black,
              side: const BorderSide(color: Colors.black),
            ).copyWith(
              backgroundColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.hovered)) return Colors.grey.shade100;
                return null;
              }),
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/login'),
            child: const Text('Sign Up'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
            ).copyWith(
              backgroundColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.hovered)) return Colors.grey.shade800;
                return Colors.black;
              }),
            ),
          ),
          const SizedBox(width: 20),
        ]:<Widget>[SizedBox.shrink()],

      ),
      drawer: (hei*0.85>wid)?Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('PTS Chemistry Class',style: TextStyle(fontSize: 24),),
          ),ListTile(
            leading: Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => Navigator.pushNamed(context, '/'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: const Text('Reviews'),
            onTap: () => Navigator.pushNamed(context, '/reviews'),
          ),ListTile(
            leading: Icon(Icons.settings),
            title: const Text('About Me'),
            onTap: () => Navigator.pushNamed(context, '/about'),
          ),ListTile(
            leading: Icon(Icons.settings),
            title: const Text('Contact'),
            onTap: () => Navigator.pushNamed(context, '/contact'),
          ),ListTile(
            leading: Icon(Icons.settings),
            title: const Text('Sign Up'),
            onTap: () => Navigator.pushNamed(context, '/login'),
          ),
        ],
      ),
    ):null,

      backgroundColor: bgcol,
      body: const Text("      Work in progress"),
    );
  }
}
