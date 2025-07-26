import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'home_page.dart';
import 'main.dart'; // Make sure this imports variables like appbgcol, bgcol, etc.

class MaterialsPage extends StatefulWidget {
  MaterialsPage({super.key});

  @override
  State<MaterialsPage> createState() => _MaterialsPageState();
}

class _MaterialsPageState extends State<MaterialsPage> {
  bool unlockedtest = false;
  final TextEditingController _codeController = TextEditingController();

  bool complexFormulaWithDate(int a) {
    var date = DateTime.now();
    int dayOfYear = int.parse(DateFormat("D").format(date));
    int weekday = date.weekday;
    int month = date.month;
    int year = date.year;
    int result = (dayOfYear * (weekday * weekday) + month * year) % 10000;
    return (result == a);
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle navLinkStyle = TextButton.styleFrom(
      foregroundColor: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      textStyle: const TextStyle(fontSize: 15),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(14))),
    ).copyWith(
      overlayColor: MaterialStateProperty.all(const Color(0xFFE3D5E8)),
      foregroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.hovered)) {
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
        automaticallyImplyLeading: (hei * 0.85 > wid) ? true : false,
        backgroundColor: appbgcol,
        foregroundColor: Colors.black,
        elevation: 1.0,
        toolbarHeight: 70,
        title: Row(children: [
          SizedBox(
            height: 70,
            width: 70,
            child: IconButton(
                onPressed: () => Navigator.pushNamed(context, '/'),
                icon: Image.asset("images/icon1.png")),
          ),
          const SizedBox(width: 5),
          const Text('Study Materials & Tests',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        ]),
        actions: (hei < wid * 0.9)
            ? <Widget>[
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
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.hovered)) {
                  return Colors.grey.shade100;
                }
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
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.hovered)) {
                  return Colors.grey.shade800;
                }
                return Colors.black;
              }),
            ),
          ),
          const SizedBox(width: 20),
        ]
            : <Widget>[const SizedBox.shrink()],
      ),
      drawer: (hei * 0.85 > wid)
          ? Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'PTS Chemistry Class',
                style: TextStyle(fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () => Navigator.pushNamed(context, '/'),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Study Materials'),
              onTap: () => Navigator.pushNamed(context, '/material'),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Reviews'),
              onTap: () => Navigator.pushNamed(context, '/reviews'),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('About Me'),
              onTap: () => Navigator.pushNamed(context, '/about'),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Contact'),
              onTap: () => Navigator.pushNamed(context, '/contact'),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Sign Up'),
              onTap: () => Navigator.pushNamed(context, '/login'),
            ),
          ],
        ),
      )
          : null,
      backgroundColor: bgcol,
      body: (!unlockedtest)
          ? ((hei < wid) ? desk(context) : mob(context))
          : testUnlockedWidget(context),
    );
  }

  Widget desk(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Study Material Link 1",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Study Material Link 2",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Study Material Link 3",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        const SizedBox(width: 10),
        const Spacer(flex: 1),
        Container(width: 1, color: Colors.black),
        const SizedBox(width: 10),
        Column(
          children: [
            const SizedBox(height: 10),
            SizedBox(
              width: 350,
              child: TextField(
                controller: _codeController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Code to access Tests',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 150,
              child: FloatingActionButton(
                child: const Text(
                  "Submit",
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  final inputText = _codeController.text.trim();

                  if (inputText.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please enter a code.')),
                    );
                    return;
                  }

                  final int? inputCode = int.tryParse(inputText);
                  if (inputCode == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Invalid code format.')),
                    );
                    return;
                  }

                  if (complexFormulaWithDate(inputCode)) {
                    print("a");
                    setState(() {
                      print("abd");
                      unlockedtest = true;
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Incorrect code.')),
                    );
                  }
                },
              ),
            ),
          ],
        ),
        const SizedBox(width: 50),
      ],
    );
  }

  Widget mob(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Study Material Link 1",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 4),
          const Text(
            "Study Material Link 2",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 4),
          const Text(
            "Study Material Link 3",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20),
          const Divider(color: Colors.black, thickness: 1),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: TextField(
              controller: _codeController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Code to access Tests',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            child: FloatingActionButton.extended(
              label: const Text("Submit"),
              onPressed: () {
                final inputText = _codeController.text.trim();

                if (inputText.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter a code.')),
                  );
                  return;
                }

                final int? inputCode = int.tryParse(inputText);
                if (inputCode == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Invalid code format.')),
                  );
                  return;
                }

                if (complexFormulaWithDate(inputCode)) {
                  print("a");
                  setState(() {
                    print("abd");
                    unlockedtest = true;
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Incorrect code.')),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget testUnlockedWidget(BuildContext context) {
    return Center(
      child: Text(
        "Google Form Links for test will come here"
      ),
    );
  }
}
