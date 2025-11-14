import 'dart:io';
import 'package:ptschemistryclass/Options.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home_page.dart';
import 'dart:ui' as ui;
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

  void _showOptionsDialog(BuildContext context, List<OptionWithLink> options) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choose an Test'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: options.map((optionWithLink) {
                return TextButton(
                  onPressed: () async{
                    Navigator.of(context).pop();
                    final Uri url = Uri.parse(
                      optionWithLink.link,
                    );
                    if (!await launchUrl(url)) {
                    //print("cant open");
                    }
                    ;
                  },
                  child: Text(optionWithLink.option),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle navLinkStyle = TextButton.styleFrom(
      foregroundColor: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      textStyle: const TextStyle(fontSize: 15),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(14)),
      ),
    ).copyWith(
      overlayColor: WidgetStateProperty.all(const Color(0xFFE3D5E8)),
      foregroundColor: WidgetStateProperty.resolveWith<Color?>((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.hovered)) {
          return Theme.of(context).primaryColor;
        }
        return Colors.black;
      }),
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
        title: Row(
          children: [
            if (kIsWeb || !Platform.isAndroid)
              SizedBox(
                height: 70,
                width: 70,
                child: IconButton(
                  onPressed: () => Navigator.pushNamed(context, '/'),
                  icon: Image.asset("images/icon1.png"),
                ),
              ),
            const SizedBox(width: 5),
            (kIsWeb)
                ? Text(
                  'Study Materials & Tests',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                )
                : Text(
                  "Study Materials",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
          ],
        ),
        actions:
            (hei < wid * 0.9)
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
                      backgroundColor: WidgetStateProperty.resolveWith((
                        states,
                      ) {
                        if (states.contains(WidgetState.hovered)) {
                          return Colors.grey.shade100;
                        }
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
                  //     backgroundColor: MaterialStateProperty.resolveWith((states) {
                  //       if (states.contains(MaterialState.hovered)) {
                  //         return Colors.grey.shade800;
                  //       }
                  //       return Colors.black;
                  //     }),
                  //   ),
                  // ),
                  const SizedBox(width: 20),
                ]
                : <Widget>[const SizedBox.shrink()],
      ),
      drawer:
          (hei * 0.85 > wid)
              ? Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    const DrawerHeader(
                      decoration: BoxDecoration(color: Colors.blue),
                      child: Text(
                        'PTS Chemistry Class',
                        style: TextStyle(fontSize: 24),
                      ),
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
      backgroundColor: bgcol,
      body:
          (!unlockedtest)
              ? ((hei < wid) ? desk(context) : mob(context))
              : testUnlockedWidget(context),
    );
  }

  Widget desk(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () async {
                final Uri url = Uri.parse(
                  'https://forms.gle/5MJZj3GGPod26jkG6',
                );
                if (!await launchUrl(url)) {
                  //print("cant open");
                }
                ;
              },
              child: Text(
                "Class 12 Online Test",
                style: TextStyle(fontSize: 20, color: Colors.blue),
              ),
            ),
            TextButton(
              onPressed: () async {
                final Uri url = Uri.parse(
                  'https://www.classmarker.com/online-test/start/?quiz=kem59aa5b4a2388a',
                );
                if (!await launchUrl(url)) {
                  //print("cant open");
                }
                ;
              },
              child: Text(
                "Class 11 Online Test",
                style: TextStyle(fontSize: 20, color: Colors.blue),
              ),
            ),
            TextButton(
              onPressed: () async {
                final Uri url = Uri.parse(
                  'https://forms.gle/RSCoc8y1AxCCx9GY7',
                );
                if (!await launchUrl(url)) {
                  //print("cant open");
                }
                ;
              },
              child: Text(
                "Class 11 Online Test",
                style: TextStyle(fontSize: 20, color: Colors.blue),
              ),
            ),
            TextButton(
              onPressed: () async {
                final Uri url = Uri.parse(
                  'https://forms.gle/rec4FsarEwuaUFtE7',
                );
                if (!await launchUrl(url)) {
                  print("cant open");
                }
                ;
              },
              child: Text(
                "Class 10 Online Test",
                style: TextStyle(fontSize: 20, color: Colors.blue),
              ),
            ),
            TextButton(
              onPressed: () async {
                final Uri url = Uri.parse(
                  'https://docs.google.com/document/d/13AH4OWre_45xdzu1_PVcFbjiIKlY2ZB6/edit?usp=sharing&ouid=105944921619763235184&rtpof=true&sd=true',
                );
                if (!await launchUrl(url)) {
                  //print("cant open");
                }
                ;
              },
              child: Text(
                "Class 10 Study Material",
                style: TextStyle(fontSize: 20, color: Colors.blue),
              ),
            ),
            TextButton(
              onPressed: () async {
                final Uri url = Uri.parse(
                  'https://forms.gle/RpC9bLp2Ag1dPkYo7',
                );
                if (!await launchUrl(url)) {
                  //print("cant open");
                }
                ;
              },
              child: Text(
                "Class 10 Online Test",
                style: TextStyle(fontSize: 20, color: Colors.blue),
              ),
            ),
            TextButton(
              onPressed: () async {
                final Uri url = Uri.parse(
                  'https://forms.gle/VZS1oJLCPYH4HY776',
                );
                if (!await launchUrl(url)) {
                  //print("cant open");
                }
                ;
              },
              child: Text(
                "Class 9 Online Test",
                style: TextStyle(fontSize: 20, color: Colors.blue),
              ),
            ),
            TextButton(
              onPressed: () async {
                final Uri url = Uri.parse(
                  'https://forms.gle/fBwisSvfCYyP7qyi9',
                );
                if (!await launchUrl(url)) {
                  ////print("cant open");
                }
                ;
              },
              child: Text(
                "Class 9 Online Test",
                style: TextStyle(fontSize: 20, color: Colors.blue),
              ),
            ),
            TextButton(
              onPressed: () async {
                final Uri url = Uri.parse(
                  'https://drive.google.com/file/d/1vx57Qw7u-wb3HxSwW5-By5YprDX8HlJG/view?usp=sharing',
                );
                if (!await launchUrl(url)) {
                  //print("cant open");
                }
                ;
              },
              child: Text(
                "JEE Free Material",
                style: TextStyle(fontSize: 20, color: Colors.blue),
              ),
            ),
            SizedBox(height: 10,),
            Text("  JEE Crash Course", style: TextStyle(fontSize: 22, color: Colors.black87),),
            TextButton(
              onPressed: () async {
                final Uri url = Uri.parse(
                  'https://drive.google.com/drive/folders/1hDEhDebtuMyRCuSc2rJEdQuQDqPj-5EH?usp=sharing',
                );
                if (!await launchUrl(url)) {
                  //print("cant open");
                }
                ;
              },
              child: Text(
                "Crash Course Materials",
                style: TextStyle(fontSize: 20, color: Colors.blue),
              ),
            ),

            TextButton(
              onPressed: () async {
                _showOptionsDialog(context, options);
              },
              child: Text(
                "Crash Course Tests",
                style: TextStyle(fontSize: 20, color: Colors.blue),
              ),
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
              width: 450,
              child: TextField(
                controller: _codeController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Code to access Premium Materials & Tests',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 150,
              child: FloatingActionButton(
                child: const Text("Submit", style: TextStyle(fontSize: 16)),
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
                    setState(() {
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
          TextButton(
            onPressed: () async {
              final Uri url = Uri.parse('https://forms.gle/5MJZj3GGPod26jkG6');
              if (!await launchUrl(url)) {
                //print("cant open");
              }
              ;
            },
            child: Text(
              "Class 12 Online Test",
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
          ),
          TextButton(
            onPressed: () async {
              final Uri url = Uri.parse(
                'https://www.classmarker.com/online-test/start/?quiz=kem59aa5b4a2388a',
              );
              if (!await launchUrl(url)) {
                //print("cant open");
              }
              ;
            },
            child: Text(
              "Class 11 Online Test",
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
          ),
          TextButton(
            onPressed: () async {
              final Uri url = Uri.parse('https://forms.gle/RSCoc8y1AxCCx9GY7');
              if (!await launchUrl(url)) {
                //print("cant open");
              }
              ;
            },
            child: Text(
              "Class 11 Online Test",
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
          ),
          TextButton(
            onPressed: () async {
              final Uri url = Uri.parse('https://forms.gle/rec4FsarEwuaUFtE7');
              if (!await launchUrl(url)) {
                //print("cant open");
              }
              ;
            },
            child: Text(
              "Class 10 Online Test",
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
          ),
          TextButton(
            onPressed: () async {
              final Uri url = Uri.parse(
                'https://docs.google.com/document/d/13AH4OWre_45xdzu1_PVcFbjiIKlY2ZB6/edit?usp=sharing&ouid=105944921619763235184&rtpof=true&sd=true',
              );
              if (!await launchUrl(url)) {
                //print("cant open");
              }
              ;
            },
            child: Text(
              "Class 10 Study Material",
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
          ),
          TextButton(
            onPressed: () async {
              final Uri url = Uri.parse('https://forms.gle/RpC9bLp2Ag1dPkYo7');
              if (!await launchUrl(url)) {
                //print("cant open");
              }
              ;
            },
            child: Text(
              "Class 10 Online Test",
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
          ),
          TextButton(
            onPressed: () async {
              final Uri url = Uri.parse('https://forms.gle/VZS1oJLCPYH4HY776');
              if (!await launchUrl(url)) {
                //print("cant open");
              }
              ;
            },
            child: Text(
              "Class 9 Online Test",
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
          ),
          TextButton(
            onPressed: () async {
              final Uri url = Uri.parse('https://forms.gle/fBwisSvfCYyP7qyi9');
              if (!await launchUrl(url)) {
                //print("cant open");
              }
              ;
            },
            child: Text(
              "Class 9 Online Test",
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
          ),
          TextButton(
            onPressed: () async {
              final Uri url = Uri.parse(
                'https://drive.google.com/file/d/1vx57Qw7u-wb3HxSwW5-By5YprDX8HlJG/view?usp=sharing',
              );
              if (!await launchUrl(url)) {
                print("cant open");
              }
              ;
            },
            child: Text(
              "JEE Free Material",
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
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
                labelText: 'Enter Code to access Premium Materials & Tests',
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
                  //print("a");
                  setState(() {
                    //print("abd");
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
    return Center(child: Text("Google Form Links for test will come here"));
  }
}
