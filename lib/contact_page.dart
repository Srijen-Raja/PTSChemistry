import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'main.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final messageController = TextEditingController();
    final ButtonStyle navLinkStyle = TextButton.styleFrom(
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
        automaticallyImplyLeading: (hei * 0.85 > wid)?true:false,
        backgroundColor: appbgcol,
        foregroundColor: Colors.black,
        elevation: 1.0,
        toolbarHeight: 70,
        title: Row(children: [
          SizedBox(height: 70, width: 70, child: IconButton(onPressed: () => Navigator.pushNamed(context, '/'), icon: Image.asset("images/icon1.png"))),
          const SizedBox(width: 5),
          const Text('Contact Me', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        ]),
        actions: (hei<wid*0.9)?<Widget>[
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/'),
            style: navLinkStyle,
            child: const Text('Home'),
          ),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/material'),
            style: navLinkStyle,
            child: const Text('Study Material / Tests'),
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
          // ElevatedButton(
          //   onPressed: () => Navigator.pushNamed(context, '/login'),
          //   child: const Text('Sign Up'),
          //   style: ElevatedButton.styleFrom(
          //     backgroundColor: Colors.black,
          //     foregroundColor: Colors.white,
          //   ).copyWith(
          //     backgroundColor: WidgetStateProperty.resolveWith((states) {
          //       if (states.contains(WidgetState.hovered)) return Colors.grey.shade800;
          //       return Colors.black;
          //     }),
          //   ),
          // ),
          const SizedBox(width: 20),
        ]:<Widget>[SizedBox.shrink()],
      ),
      backgroundColor: bgcol,
      drawer: (hei * 0.85 > wid)
          ? Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('PTS Chemistry Class', style: TextStyle(fontSize: 24)),
            ),
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Home'),
              onTap: () => Navigator.pushNamed(context, '/'),
            ),
            ListTile(
              leading: const Icon(Icons.book_outlined),
              title: const Text('Study Materials'),
              onTap: () => Navigator.pushNamed(context, '/material'),
            ),
            ListTile(
              leading: const Icon(Icons.reviews_outlined),
              title: const Text('Reviews'),
              onTap: () => Navigator.pushNamed(context, '/reviews'),
            ),
            ListTile(
              leading: const Icon(Icons.account_box_outlined),
              title: const Text('About Me'),
              onTap: () => Navigator.pushNamed(context, '/about'),
            ),
            ListTile(
              leading: const Icon(Icons.quick_contacts_dialer_outlined),
              title: const Text('Contact'),
              onTap: () => Navigator.pushNamed(context, '/contact'),
            ),
            // ListTile(
            //   leading: const Icon(Icons.settings),
            //   title: const Text('Sign Up'),
            //   onTap: () => Navigator.pushNamed(context, '/login'),
            // ),
          ],
        ),
      )
          : null,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Get in Touch',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Have a question or want to book a session? Call, Whatsapp or Telegram me.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5,),
            const Text(
              'Please include all relevant details such as Grade, board(CBSE, State etc) and Country.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5,),
            const Text(
              'Contact no. +91 7448961696',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            TextButton(child: Text("To Register for Admissions Please Click here",style: TextStyle(fontSize: 16,color: Colors.blue)),
    onPressed: () async {
    final Uri url = Uri.parse('https://forms.gle/NFtq2u4FPyXvdvRe6');
    if (!await launchUrl(url)) {
    //print("cant open");
    };
    }

            ),
            // Form(
            //   key: formKey,
            //   child: Column(
            //     children: <Widget>[
            //       TextFormField(
            //         controller: nameController,
            //         decoration: const InputDecoration(
            //           labelText: 'Name',
            //           border: OutlineInputBorder(),
            //         ),
            //         validator: (value) => (value == null || value.isEmpty) ? 'Please enter your name' : null,
            //       ),
            //       const SizedBox(height: 16),
            //       TextFormField(
            //         controller: emailController,
            //         decoration: const InputDecoration(
            //           labelText: 'Email',
            //           border: OutlineInputBorder(),
            //         ),
            //         validator: (value) => (value == null || !value.contains('@')) ? 'Please enter a valid email' : null,
            //       ),
            //       const SizedBox(height: 16),
            //       TextFormField(
            //         controller: messageController,
            //         decoration: const InputDecoration(
            //           labelText: 'Message',
            //           border: OutlineInputBorder(),
            //         ),
            //         maxLines: 5,
            //         validator: (value) => (value == null || value.isEmpty) ? 'Please enter your message' : null,
            //       ),
            //       const SizedBox(height: 24),
            //       ElevatedButton(
            //         onPressed: () {
            //           if (formKey.currentState!.validate()) {
            //             ScaffoldMessenger.of(context).showSnackBar(
            //               const SnackBar(content: Text('Thank you for your message!')),
            //             );
            //             nameController.clear();
            //             emailController.clear();
            //             messageController.clear();
            //           }
            //         },
            //         style: ElevatedButton.styleFrom(
            //           padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            //         ),
            //         child: const Text('Send Message', style: TextStyle(fontSize: 16)),
            //       ),
            //     ],
            //   ),
            // ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FloatingActionButton(onPressed: () async {
                  final Uri url = Uri.parse('https://www.youtube.com/@SrinivasanPT');
                  if (!await launchUrl(url)) {
                   // print("cant open");
                  }
                }
                    ,elevation: 0, hoverElevation: 10,splashColor: Colors.deepPurple,backgroundColor: Colors.transparent,child: Image.asset("images/youtube.png")),
                SizedBox(width: 5,),
                FloatingActionButton(onPressed: () async {
                  final Uri url = Uri.parse('https://api.whatsapp.com/send/?phone=917448961696&text&type=phone_number&app_absent=0');
                  if (!await launchUrl(url)) {
                   // print("cant open");
                  }
                },elevation: 0,hoverElevation: 10,splashColor: Colors.deepPurple,backgroundColor: Colors.transparent ,child: Image.asset("images/whatsapp.png")),
                SizedBox(width: 5,),
                FloatingActionButton(onPressed: () async {
                  final Uri url = Uri.parse('https://www.facebook.com/PaadhoorThiruvengadachariSrinivasan/');
                  if (!await launchUrl(url)) {
                    //print("cant open");
                  }
                },elevation: 0,hoverElevation: 10,splashColor: Colors.deepPurple,backgroundColor: Colors.transparent, child: Image.asset("images/facebook.png")),
                SizedBox(width: 5,),
                FloatingActionButton(onPressed: () async {
                  final Uri url = Uri.parse('https://www.instagram.com/profpts/');
                  if (!await launchUrl(url)) {
                  //  print("cant open");
                  }
                },elevation: 0,hoverElevation: 10,splashColor: Colors.deepPurple,backgroundColor: Colors.transparent, child: Image.asset("images/instagram.png"),),
                SizedBox(width: 5,),
                FloatingActionButton(onPressed: () async {
                  final Uri url = Uri.parse('https://t.me/ptschemistryclass');
                  if (!await launchUrl(url)) {
                   // print("cant open");
                  }
                },elevation: 0,hoverElevation: 10,splashColor: Colors.deepPurple,backgroundColor: Colors.transparent ,child: Image.asset("images/telegram.png")),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
